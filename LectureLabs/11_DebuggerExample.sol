// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract DebuggerExample {
    uint public myUint;
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
}