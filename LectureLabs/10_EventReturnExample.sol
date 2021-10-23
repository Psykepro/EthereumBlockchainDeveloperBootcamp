// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract EventReturnExample {
    mapping(address => uint) public tokenBalance;
    
    event TokensSent(address _from, address _to, uint _amount);
    
    constructor() {
        tokenBalance[msg.sender] = 100;
    }
    
    function sendToken(address _to, uint _amount) public returns(bool) {
        require(tokenBalance[msg.sender] >= _amount, "Not enought tokens");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    
        emit TokensSent(msg.sender, _to, _amount);
    
        return true;
    }
    
    
}