# Smart Contract Security Audit Checklist

## 1. Access Control
- [ ] Is `Ownable` implemented correctly?
- [ ] Are critical functions protected by `onlyRole` or `onlyOwner`?
- [ ] Is there a mechanism to transfer or renounce ownership?

## 2. Arithmetic Operations
- [ ] Are you using Solidity 0.8+ (built-in overflow checks)?
- [ ] Are there any potential precision loss issues in divisions?
- [ ] Check for rounding errors in yield calculations.

## 3. External Calls
- [ ] Are external calls following the Checks-Effects-Interactions pattern?
- [ ] Is `call()` used instead of `transfer()` or `send()`?
- [ ] Is the gas limit handled for external calls?

## 4. DeFi Specifics
- [ ] Is the price oracle manipulation-resistant?
- [ ] Check for flash loan attack vectors.
