// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MultiLocationEncoder.sol";
import "../src/utils/CompactTypes.sol";

contract MultiLocationEncoderTest is Test {
    MultiLocationEncoder public encoder;

    function setUp() public {
        encoder = new MultiLocationEncoder();
    }

    function testEncodeMultiLocationSameConsensusParachain() public {
        bytes memory testValue = "\x00\x01\x00\xa1\x0f";
        bytes memory encodedValue = encoder.encodeMultiLocationSameConsensusParachain(0, 1000);
        assertEq(testValue, encodedValue);
    }

    function testEncodeMultiLocationSameConsensusAccountId32() public {
        bytes memory testValue = "\x00\x02\x00\xa1\x0f\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00";
        bytes memory encodedValue = encoder.encodeMultiLocationSameConsensusAccountId32(0, 1000, 0x0000000000000000000000000000000000000000000000000000000000000000);
        assertEq(testValue, encodedValue);
    }
}
