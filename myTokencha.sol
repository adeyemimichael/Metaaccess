// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

pragma solidity ^0.8.0;

contract MyToken {
    string public tokenName = "MetaToken"; // name of the token
    string public tokenAbbrev = "MToken"; // abbreviation of the token
    uint public totalSupply = 0; // total supply of the token
    uint public maxSupply = 1000000; // maximum supply cap of the token
    bool public paused = false; // flag to indicate whether the contract is paused
    address public owner; // address of the contract owner

    mapping (address => uint) public balances; // mapping to track the balance of each address

    constructor() {
        owner = msg.sender; // set the owner of the contract to the address that deploys the contract
    }

    function mint(address _address, uint _value) public {
        require(!paused, "Contract is paused"); // check if the contract is not paused
        require(totalSupply + _value <= maxSupply, "Max supply exceeded"); // check if the maximum supply cap is not exceeded
        totalSupply += _value; // increase the total supply by the minted value
        balances[_address] += _value; // increase the balance of the specified address by the minted value
    }

    function burn(address _address, uint _value) public {
        require(!paused, "Contract is paused"); // check if the contract is not paused
        if (balances[_address] >= _value) { // check if the balance of the specified address is greater than or equal to the burned value
            totalSupply -= _value; // decrease the total supply by the burned value
            balances[_address] -= _value; // decrease the balance of the specified address by the burned value
        }
    }

    function transfer(address _to, uint _value) public {
        require(!paused, "Contract is paused"); // check if the contract is not paused
        require(balances[msg.sender] >= _value, "Insufficient balance"); // check if the balance of the sender is greater than or equal to the transfer value
        balances[msg.sender] -= _value; // decrease the balance of the sender by the transfer value
        balances[_to] += _value; // increase the balance of the recipient by the transfer value
    }

    function setMaxSupply(uint _maxSupply) public {
        require(msg.sender == owner, "Caller is not the owner"); // check if the caller is the owner of the contract
        maxSupply = _maxSupply; // set the maximum supply cap to the specified value
    }

    function pauseContract() public {
        require(msg.sender == owner, "Caller is not the owner"); // check if the caller is the owner of the contract
        paused = true; // set the paused flag to true
    }

    function resumeContract() public {
        require(msg.sender == owner, "Caller is not the owner"); // check if the caller is the owner of the contract
        paused = false; // set the paused flag to false
    }
}
