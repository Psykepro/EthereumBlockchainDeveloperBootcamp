
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionsExample {
    
    mapping(address => uint) public balanceReceived;
    
    address payable owner;
    
    constructor() {
        owner = payable(msg.sender);
    }
    
    // View Function: A view function has only read access to the state of the Smart Contract but can't modify it. So it can call only other view functions or pure functions other pure functions but can't call write. (Virtually free)
    function getOwner() public view returns(address) {
        return owner;
    }
    
    // Pure Function: Can call only other pure functions and don't have acceess to the state of the Smart Contract (Virtually free)
    function convertWeiToEther(uint _amountInWei) public pure returns(uint) {
        return _amountInWei / 1 ether;
    }
    
    // Write Function: It has read and write access to the state of the Smart Contract so it can modify it. And can call all 3 types of functions write, view and pure functions.
    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }
    
    function destroySmartContract() public {
        require(msg.sender == owner, "You are not the owner.");
        selfdestruct(owner);
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Not enough funds.");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
    
    // Receive Function: This function is executed on a call to the contract with empty calldata. If no such function exists, but a payable fallback function exists.
    receive() external payable {
        receiveMoney();
    }
    
    // Fallback Function: This function is called  when a non-existent function is called on the contract or no receive function.
    fallback() external payable {
        receiveMoney();
    }
}