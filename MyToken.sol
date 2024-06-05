// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {

    // Public variables to store token details
    string public name = "MyToken";        // Token Name
    string public symbol = "MTK";          // Token Abbreviation
    uint256 public totalSupply;            // Total Supply of tokens

    // Mapping of addresses to their balances
    mapping(address => uint256) public balances;

    // Event to log minting actions
    event Mint(address indexed to, uint256 value);

    // Event to log burning actions
    event Burn(address indexed from, uint256 value);

    // Mint function to create new tokens
    function mint(address to, uint256 value) public {
        totalSupply += value;              // Increase total supply by the value
        balances[to] += value;             // Increase the balance of the 'to' address by the value
        emit Mint(to, value);              // Emit mint event
    }

    // Burn function to destroy tokens
    function burn(address from, uint256 value) public {
        require(balances[from] >= value, "Insufficient balance to burn"); // Check if the 'from' address has enough tokens to burn
        totalSupply -= value;              // Decrease total supply by the value
        balances[from] -= value;           // Decrease the balance of the 'from' address by the value
        emit Burn(from, value);            // Emit burn event
    }
}
