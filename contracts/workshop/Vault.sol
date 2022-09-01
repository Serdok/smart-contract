// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract WrongVault {
    mapping(address => uint) public balances;

    /// @dev Store ETH in the contract.
    function store() public payable {
        balances[msg.sender] += msg.value;
    }

    /// @dev Redeem your ETH.
    function redeem() public payable {
        msg.sender.call({value : balances[msg.sender]});
        balances[msg.sender] = 0;
    }
}

contract Vault {
    mapping(address => uint) public balances;

    /// @dev Store ETH in the contract.
    function store() public payable {
        balances[msg.sender] += msg.value;
    }

    /// @dev Redeem your ETH.
    function redeem() public payable {
        msg.sender.call({value : balances[msg.sender]});
        balances[msg.sender] = 0;
    }
}