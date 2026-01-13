// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GasOptimizationReport {
    // UNOPTIMIZED
    uint256[] public data;
    function badLoop() public {
        for (uint256 i = 0; i < data.length; i++) {
            // Expensive state reads in every iteration
        }
    }

    // OPTIMIZED
    function goodLoop() public view {
        uint256 length = data.length; // Cache length
        uint256[] memory _data = data; // Cache to memory
        for (uint256 i = 0; i < length; i++) {
            // Do something with _data[i]
        }
    }
}
