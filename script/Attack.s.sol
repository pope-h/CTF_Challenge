// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/Challenge.sol";
import "../src/Attack.sol";

contract AttackScript is Script {
    function setUp() public {}

    function run() public {
        uint private_key = vm.envUint("DEV_PRIVATE_KEY");
        address account = vm.addr(private_key);
        console.log("Account", account);

        vm.startBroadcast(private_key);

        // Deploy the Attack contract
        // 0xC15082ecF9122c607b053b00a36B8C497564F2A3 is the address of the Challenge contract
        Attack attack = new Attack(address(0xC15082ecF9122c607b053b00a36B8C497564F2A3));
        console.log("Contract deployed to: ", address(attack));

        // Call the attack function
        attack.attack("hacker");

        vm.stopBroadcast();
    }
}
