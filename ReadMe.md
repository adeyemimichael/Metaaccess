README

# Metaaccess

Simple overview of use/purpose.

## Description

This is a simple ERC20 token contract that allows for minting and burning of tokens. The contract defines a public token name and abbreviation, as well as a total supply of 0 to start with. 
The contract also includes a mapping of addresses to balances, which can be used to keep track of the token balance of each address.

The `mint` function can be used to mint new tokens by specifying an address and a value to be added to the total supply and balance of the specified address. 

The `burn` function can be used to burn tokens by specifying an address and a value to be subtracted from the total supply and balance of the specified address. Before performing the burning operation, the function first checks if the specified address has sufficient balance to burn the requested amount.

The contract can be used as a template for creating your own ERC20 token with custom token name, abbreviation, and total supply. You can also modify the contract to include additional functions, such as a transfer function for transferring tokens between addresses.

## Getting Started

### Installing
* git clone <repository_url](https://github.com/adeyemimichael/Metaaccess>
*(https://github.com/adeyemimichael/Metaaccess)
* Any modifications needed to be made to files/folders
Clone the repository by forking it.
cd <repository_directory>
### Executing program

* Step-by-step bullets
```

code blocks for commands
```npm install
npx hardhat compile
npx hardhat test


## Help
```

## Authors

ex.Ayobami Akande 
https://www.linkedin.com/in/akandeayobami/
https://twitter.com/akandealabi1



