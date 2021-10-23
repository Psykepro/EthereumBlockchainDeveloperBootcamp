// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./common/Owned.sol";

contract InheritanceAndModifiersExample is Owned {
    mapping(address => uint) public tokenBalance;
    
    
    uint tokenPrice = 1 ether;
    
    constructor() {
        owner = msg.sender;
        tokenBalance[owner] = 100;
    }
    
    function createNewToken() public onlyOwner {
        tokenBalance[owner]++;
    }
    
    function burnToken() public onlyOwner {
        tokenBalance[owner]--;
    }
    
    function purchaseToken() public payable {
        require((tokenBalance[owner] * tokenPrice) - msg.value > 0, "Not enough tokens.");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }
    
}