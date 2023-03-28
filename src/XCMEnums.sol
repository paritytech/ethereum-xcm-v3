// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.13;

library XCMEnums {
    
    enum XcmV3Junction {
        Parachain, 
        AccountId32,
        AccountIndex64, 
        AccountKey20,
        PalletInstance, 
        GeneralIndex,
        GeneralKey,
        OnlyChild, 
        Plurality,
        GlobalConsensus
    }

    enum XcmV3Junctions {
        Here, 
        X1, 
        X2,
        X3,
        X4,
        X5,
        X6,
        X7,
        X8
    }

    enum XcmV3JunctionNetworkId {
        ByGenesis,
        ByFork,
        Polkadot, 
        Kusama, 
        Westend, 
        Rococo,
        Wococo,
        Ethereum,
        BitcoinCore, 
        BitcoinCash
    }
}