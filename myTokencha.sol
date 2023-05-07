// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// public variable here 
 contract MyToken {
 string public tokenName = "MetaToken";
 string public tokenAbbrev = "MToken";
 uint public totalSupply = 0;


 //mapping variable here 
 mapping (address => uint ) public balances;

//mint function 
 function mint(address _address, uint _value) public {
totalSupply += _value;
balances[_address] += _value;
 }

 //burn function here
  function burn (address _address, uint _value) public {
      if (balances [_address] >= _value) {
totalSupply -= _value;
balances[_address] -= _value;
 }
 }
 }
 