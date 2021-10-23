// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract WorkingWithVariables {
    uint256 public myUint256;
    uint8 public myUint8;
    
    function setMyUint256(uint newVal) public {
        myUint256 = newVal;
    }
    
    function incrementUint8() public {
        myUint8++;
    }
    
    function decrementuint8() public {
        myUint8--;
    }
    
    address public myAddress;
    
    function setAddress(address _address) public {
        myAddress = _address;
    }
    
    function getBalanceOfAddress() public view returns (uint) {
        return myAddress.balance;
    }
    
}