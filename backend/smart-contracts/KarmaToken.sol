// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KarmaToken {
    string public name = "KarmaToken";
    string public symbol = "KARMA";
    uint8 public decimals = 18;
    uint public totalSupply;

    mapping(address => uint) public balanceOf;

    constructor() {
        totalSupply = 1_000_000 * 10**decimals;
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint amount) public returns (bool) {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        return true;
    }
}