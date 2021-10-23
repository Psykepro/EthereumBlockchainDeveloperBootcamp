// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Owned {
    address owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not allowed.");
        _; // <- this underscore will be replaced with the code of the function on which the modifier is used
    }
}