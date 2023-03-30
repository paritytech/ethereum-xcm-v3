// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.13;

import "./utils/ScaleCodec.sol";
import "./utils/CompactTypes.sol";

contract MultiLocationEncoder {

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

    function encodeRelativeParachain(
        uint8 parents,
        uint256 parachainId
    )
    public pure returns (bytes memory) {
        XcmV3Junctions interiorJunctions = XcmV3Junctions.X1;
        XcmV3Junction firstJunction = XcmV3Junction.Parachain;
        return bytes.concat(
            ScaleCodec.encodeU8(uint8(parents)),
            ScaleCodec.encodeU8(uint8(interiorJunctions)),
            ScaleCodec.encodeU8(uint8(firstJunction)),
            CompactTypes.encodeCompactUint(parachainId)
        );
    }

    function encodeRelativeAccountId32(
        uint8 parents,
        uint256 parachainId,
        bytes32 accountId32
    )
    public pure returns (bytes memory) {
        XcmV3Junctions interiorJunctions = XcmV3Junctions.X2;
        XcmV3Junction firstJunction = XcmV3Junction.Parachain;
        XcmV3Junction secondJunction = XcmV3Junction.AccountId32;
        return bytes.concat(
            ScaleCodec.encodeU8(uint8(parents)),
            ScaleCodec.encodeU8(uint8(interiorJunctions)),
            ScaleCodec.encodeU8(uint8(firstJunction)),
            CompactTypes.encodeCompactUint(parachainId),
            ScaleCodec.encodeU8(uint8(secondJunction)),
            accountId32
        );
    }

    function encodeMultiLocationAccountId32(
        bytes32 accountId32
    )
    public pure returns (bytes memory) {
        XcmV3Junction junction = XcmV3Junction.AccountId32;
        return bytes.concat(
            ScaleCodec.encodeU8(uint8(junction)),
            accountId32
        );
    }

}
