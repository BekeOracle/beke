# About Beke Oracke

## Overview

BekeOracle Lab was founded in February 2020 aiming at building a decentralized network of oracle which dedicated to work on the external information written into the blockchain. Which could offer a solution of decentralizing Oracle mechanism between blockchian and the real world.

BekeOracle allows smart contracts react to unknown external world in order to make blockchain capable of functioning in actual world practical applications. 

BekeOracle believes that the oracle as the bridge between blockchain and real world extends its application scenarios, it will cover various DApp categories such as financial derivatives trading platforms, lending platforms, express tracking/IoT, stable coins, games, insurance, prediction markets, etc.

## Concept

BekeOracle provides a decentralized Service platform for all DApps to serve data interacting with the real world. Through the interaction between the smart contract Service Contract and the Oracle Contract, it enables the blockchain data to interact with the external world and ensures the accuracy and reliability of the oracle data.

In the design of Off-chain, BekeOracle proposed DAO voting, which accuracy and applicability were verified by Beke, the first token issued by BekeOracle.

In order to prevent the trust problem of node propagators, BekeOracle propagators are co-executed by multiple decentralized nodes for request processing of propagator data. BekeOracle aggregation algorithm will have BFT consensus algorithm and DAO voting to govern together.

To prevent the trust problem of node propagators, BekeOracle propagator is co-executed by multiple decentralized nodes to process of propagator data. BekeOracle’s aggregation algorithm will be voting to govern by BFT consensus algorithm and DAO.

## What is Beke?

Beke is the first contract token issued by BekeOracle and the only BekeOracle equity token. Beke’s price will be prophesied in the oracle, through voting in the Oracle Service's built-in DAO to ensure prophecy validity, and Beke will be the only Gas fee token when the DApp acquires the oracle interaction.

Beke is also a ductility algorithmic value-added coin issued by BekeOracle, the coin’s price will increase or decrease the amount of Beke held by the address through volatility every 4 hours.

## Volatility

The BekeOracle Volatility Prognosis will be calculated in every 4 hours using the price fluctuations, the volatility is determined by the range of fluctuations and the volatility constants.
$$
R_wave=|(H_{price}-L_{price})/(H_{price}+L_{price}|*C_{rate}
$$
Rwave represents the price fluctuation in a time period, Crate is the fluctuation constant converted by votes in the BekeOracle, the default value is 1, DAO pool will determine weather to adjust or not in the subsequent adjustment, this is due to the 4-hour price fluctuation to increase or decrease the number of Beke held by the address.

The amount of Beke held by all addresses will change based on the volatility of Rwave. When the 4-hour price volatility exceeds 5%, an adjustment to the Beke contract is triggered and the price volatility Rwave is recalculated.

## Token Distribution

Beke, initial offer 600,000 tokens, following adjustment will be made by Beke real-time liquidity which follow by market fluctuations and self-adjustment of holding fluctuations predicted by the oracle. The initial price of Beke will be anchored at 1 USDT and the fund-raising limit for a single address will be 500 USDT, with a weighted allocation based on the number of fundraisers and a full winning amount for those who participate in the white list.

300,000 Beke will be distributed directly to participating fund raising addresses for market circulation to make the Beke price volatile.

300,000Beke:300,000USDT will go to the Dex as the initial liquidity pool, i.e. the offering price is 1USDT.

The development team will allocate 5% of the increasing amount as the ongoing development costs and ecological expansion costs, this is the strategy used to forward adjusts the number of Beke addresses held.3% of the increase will be allocated by the DAO pool as DAO pool incentive and 2% of the increase will be allocated by the LP pool as LP farming incentive.

## DAO Benefits

When the price of Beke increases, the amount of Beke held by the address will increase proportionally based on the price volatility Rwave, the assets staked by the DFO pool will also increase proportionally, and 3% of the total increase will be used as the DAO pool incentive.

When the price of Beke falls, the amount of Beke held by the address will decrease in proportion to the price volatility Rwave, but the amount of holdings going into the DAO pool will not decrease in proportion to the price volatility.

When the price of Beke falls, the amount of Beke held by the address will decrease in proportion, by the price volatility Rwave, but the amount of holdings going into the DAO pool will not decrease in proportion to the price volatility.

All addresses in the DAO pool is staked can be deposit or withdraw, and all DAO pools has equal weighting. After the DAO pool application is withdrawn, the addresses will wait for redemption according to the corresponding DAO pool cycle, and the staked Beke in the DAO can be withdrawn at any time after the end of the waiting cycle.

The DAO is also entitled to the DAO pool incentive bonus allocated when the Beke meets price expectations.

## LP Liquidity Farming

In order to stimulate holders and increase Beke liquidity, we provide you with USDT-Beke liquidity LP pool nondestructive farming.

Beke stored in LP will not participate in positive or negative adjustment, when Beke positive adjustment is needed, 2% of the increase in Beke will be allocated as LP pool revenue. In the LP pool, USDT-Beke trading pairs support staked and retrieval operations at any time.

## Beke Price Expectation Incentive

To test the accuracy and effectiveness of BekeOracle, BekeOracle will prophesy three stages of price trends, 10X, 20X, 80X, where X represents the initial price.

When the Beke price reaches each price expectation, Beke will add the same amount of Beke as the initial issue for DAO pool incentive, and all addresses participating in the DAO pool will be weighted to allocate Beke.

When all three price expectations are met, BekeOracle will open the actual application to use Beke to build the BekeOracle ecology.

## BekeOracle Ecology

BekeOracle will serve all Dapps that need to communicate with external data for the oracle, which will include chat, sense information, random seed, payment, insurance, market prediction, etc. As a gateway for smart contract and external communication, BekeOracle will become a bridge for blockchain to interact with the external world, facilitating various Dapps to effectively and quickly build application scenarios and cast BekeOracle ecology.

# Description of Directory Structure

```
├── contracts
│   ├── Common.sol					// public contract
│   ├── BekeOracle.sol				// contract token BEKE
│   ├── WhiteList.sol				// contract white list
│   ├── Crowdfunding.sol			// contract crowdfunding
│   ├── DAO.sol						// contract DAO pool
│   ├── Farm.sol					// contract Farm
│   ├── PriceFromPancakeSwap.sol	// contract to get token price
│   ├── lib							// library
│       ├──Address.sol				// lib of address
│       ├── SafeMath.sol			// lib of math
│       ├── Strings.sol				// lib to operate string
│       └── TransferHelper.sol		// lib of transfer
│   ├── interface					// interface
│       ├── IERC20.sol				// norm of IERC-20
│       ├── IBEKE.sol				// interface of Token BEKE
│       ├── IWhiteList.sol			// interface of pancake swap
│       ├── ICrowdfunding.sol		// interface of Crowdfunding
│       ├── IFarm.sol				// interface of Farm
│       ├── IPancakeFactory.sol		// interface of pancake swap
│       ├── IPancakePair.sol		// interface of pancake swap
│       └── IPancakeRouter.sol		// interface of pancake swap
└── Readme.md						// help
```

# Important Processes of BEKE

## Step 1

The first stage is the white list application. Everyone can apply for a white list quota by completing the white list task. In the end, it must be approved to take effect.

## Step 2

Anyone can conduct crowdfunding, but the white list can get a maximum of 500 USDT, and the others are weighted averages. Everyone can get BEKE equal to the winning USDT, and the rest USDT will be returned in full. The initial price of BEKE is 1 USDT.

## Step 3

When you have BEKE token in your address, you can deposit it into DAO. This part of BEKE will not be affected by the price drop, and you can get additional income after the price increase.

## Step 4

You can also add liquidity to your BEKE and USDT, and then use the obtained LP to Farm to earn more BEKE.