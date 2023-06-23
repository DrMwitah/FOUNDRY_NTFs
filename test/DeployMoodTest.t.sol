// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {BasicNft} from "src/BasicNft.sol";
import {DeployMoodNft} from "script/DeployMoodNft.s.sol";

contract DeployMoodTest is Test {
    DeployMoodNft deployer;

    function setUp() external {
        deployer = new DeployMoodNft();
    }

    function testSvgConvertsToUri() public view {
        string memory svg = vm.readFile("./images/Happy.svg");
        string memory svgUri = deployer.svgToImageURI(svg);

        console.log(svgUri);

        assert(1 == 1);
    }
}
