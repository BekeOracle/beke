// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;


import './lib/SafeMath.sol';
import './interface/IBEKE.sol';
import './interface/IERC20.sol';
import "./Common.sol";

contract FarmConstant is Common{
    
    using SafeMath for uint256;

    event Deposit(address indexed _addr, uint256 amount, uint256 timestamp);

    //Total Deposit
    uint256 _totalDeposit;

    //Total Reward
    uint256 _totalReward;

    struct user{
        address userAddress;
        uint256 freeze;
        uint256 reward;
    }

    address[] _userAddrs;

    mapping(address => user) _userMapping;

    address _pairAddress;

    address _bekeAddress;

    address _crowdfundingAddress;

    IERC20 _pairERC20;

    // BEKE ERC20 interface
    IERC20 _BEKEContractERC20;

    modifier onlyBEKEContract() {
        require(_msgSender() == _bekeAddress, "require BEKE contract address");
        _;
    }

    modifier onlyCrowdfundingContract() {
        require(_msgSender() == _crowdfundingAddress, "require crowdfunding contract address");
        _;
    }

    // function of BEKE
    function _setBEKEAddress(address _addr) internal {
        require(_addr != address(0) , 'require address(0)');
        _bekeAddress = _addr;
        _BEKEContractERC20 = IERC20(_addr);
    }

    // function of crowdfunding
    // set
    function _setCrowdfundingAddress(address _addr) internal {
        _crowdfundingAddress = _addr;
    }

    // function of  pair
    // set 
    function _setPairAddress(address _addr) private {
        require(_addr != address(0) , 'require address(0)');
        _pairAddress = _addr;
        _pairERC20 = IERC20(_addr);
    }

    function setPairAddress(address _addr) external onlyCrowdfundingContract{
         _setPairAddress(_addr);
    }
}


contract Farm is FarmConstant{
    constructor(address crowdfundingAddress, address BEKEAddress) public {
        _setPublisher();
        _setBEKEAddress(BEKEAddress);
        _setCrowdfundingAddress(crowdfundingAddress);
    }
    
    //deposit
    function deposit(uint256 amount) external{
         require(amount > 0 , "the amount must more than zero");
         if(_userMapping[_msgSender()].userAddress == address(0)){
             // if user never deposit, create a new user struct and push it into _userAddrs array,add it to _userMapping
            _userMapping[_msgSender()] = user(_msgSender(),amount,0);
            _userAddrs.push(_msgSender());
         }else{
             // user is not first depost , add freeze
            _userMapping[_msgSender()].freeze = _userMapping[_msgSender()].freeze.add(amount);
         }
         // update totalDeposit
        _totalDeposit = _totalDeposit.add(amount);
        // transfer LP token from user address to this contract
        _pairERC20.transferFrom(_msgSender(),address(this),amount);
        emit Deposit(_msgSender(),amount,block.timestamp);
    }

    //calculate reward  only beke call
    function reward(uint256 amount)  external onlyBEKEContract{
        _totalReward = _totalReward.add(amount);
        for(uint i=0;i<_userAddrs.length;i++){
            _userMapping[_userAddrs[i]].reward = _userMapping[_userAddrs[i]].reward.add(_userMapping[_userAddrs[i]].freeze.mul(amount).div(_totalDeposit));
        }
    }

    //withdraw
    function withdraw() external{
        require(_userMapping[_msgSender()].freeze > 0, "the freeze must more than zero");
        _pairERC20.transfer(_msgSender(),_userMapping[_msgSender()].freeze);
        _totalDeposit = _totalDeposit.sub(_userMapping[_msgSender()].freeze);
        _userMapping[_msgSender()].freeze = 0;
    }

    //receive
    function receiveIncome() external{
        require(_userMapping[_msgSender()].reward > 0, "the reward must more than zero");
        _BEKEContractERC20.transfer(_msgSender(),_userMapping[_msgSender()].reward);
        _userMapping[_msgSender()].reward = 0;
    }
    
    function lpShow() external view returns(uint256 totalDeposit,uint256 totalReward){
        return (_totalDeposit,_totalReward);
    }
    
    function userInfos() external view returns(user memory userInfo){
        return _userMapping[_msgSender()];
    }
}