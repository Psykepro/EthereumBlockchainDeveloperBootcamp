pragma solidity ^0.8.7;

contract SimpleMappingExample {
    
    mapping (uint => bool) public myMapping;
    mapping (address => bool) public whitelistedAddresses;
    
    function setValue(uint _key, bool _value) public {
        myMapping[_key] = _value;
    } 

    function whitelistAddress(address _address) public {
        whitelistedAddresses[_address] = true;
    }
}