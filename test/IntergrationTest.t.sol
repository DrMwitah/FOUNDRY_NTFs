// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {MoodNft} from "src/MoodNft.sol";
import {DeployMoodNft} from "./DeployMoodTest.t.sol";

contract MoodNftIntergrationTest is Test {
    MoodNft moodNft;
    DeployMoodNft deployer;
    address public USER = makeAddr("user");

    function setUp() external {
        deployer = new DeployMoodNft();
        moodNft = deployer.run();
    }

    function testViewTokenURI() public {
        vm.prank(USER);
        moodNft.mintNft();
        console.log(moodNft.tokenURI(0));
    }

    function testFlipTokenToSad() public {
        vm.prank(USER);
        moodNft.mintNft();

        vm.prank(USER);
        moodNft.flipMood(0);
        console.log(moodNft.tokenURI(0));
    }
}
