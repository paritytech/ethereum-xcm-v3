// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MultiLocationEncoder.sol";

contract MultiLocationEncoderTest is Test {
    MultiLocationEncoder public encoder;

    function setUp() public {
        encoder = new MultiLocationEncoder();
    }
}
