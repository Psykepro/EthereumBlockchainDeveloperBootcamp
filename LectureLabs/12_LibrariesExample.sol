// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract LibrariesExample {
    
    mapping(address => uint) public tokenBalance;
    
    using SafeMath for uint;
    
    constructor() {
        tokenBalance[msg.sender] = 1;
    }
    
    function sendToken(address _to, uint _amount) public returns(bool) {
        tokenBalance[msg.sender] = tokenBalance[msg.sender].sub(_amount);
        tokenBalance[_to] = tokenBalance[_to].add(_amount);
        
        return true;
    }
}