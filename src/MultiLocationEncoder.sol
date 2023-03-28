// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.13;

import "./XCMEnums.sol";
import "./utils/ScaleCodec.sol";
import "./utils/CompactTypes.sol";

contract MultiLocationEncoder {

    function encodeMultiLocationSameConsensusParachain(
        uint8 parents,
        uint256 parachainId
    )
    public pure returns (bytes memory) {
        XCMEnums.XcmV3Junctions interiorJunctions = XCMEnums.XcmV3Junctions.X1;
        XCMEnums.XcmV3Junction firstJunction = XCMEnums.XcmV3Junction.Parachain;
        return abi.encodePacked(
            ScaleCodec.encodeU8(uint8(parents)),
            ScaleCodec.encodeU8(uint8(interiorJunctions)),
            ScaleCodec.encodeU8(uint8(firstJunction)),
            CompactTypes.encodeCompactUint(parachainId)
        );
    }

    function encodeMultiLocationSameConsensusAccountId32(
        uint8 parents,
        uint256 parachainId,
        bytes32 accountId32
    )
    public pure returns (bytes memory) {
        XCMEnums.XcmV3Junctions interiorJunctions = XCMEnums.XcmV3Junctions.X2;
        XCMEnums.XcmV3Junction firstJunction = XCMEnums.XcmV3Junction.Parachain;
        XCMEnums.XcmV3Junction secondJunction = XCMEnums.XcmV3Junction.AccountId32;
        return abi.encodePacked(
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
        XCMEnums.XcmV3Junction junction = XCMEnums.XcmV3Junction.AccountId32;
        return abi.encodePacked(
            ScaleCodec.encodeU8(uint8(junction)),
            accountId32
        );
    }
}
