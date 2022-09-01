// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract WrongSimpleContract {
    mapping(address => uint) public balances;

    /// @dev Buy token at the price of 1ETH/token.
    function buyToken() public payable {
        balances[msg.sender] += msg.value / 1 ether;
    }

    /** @dev Send token.
     *  @param _recipient The recipient.
     *  @param _amount The amount to send.
     */
    function sendToken(address _recipient, uint _amount) public {
        // You must have some tokens.
        require(balances[msg.sender] != 0);

        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
    }
}

contract SimpleContract {
    mapping(address => uint) public balances;

    /// @dev Buy token at the price of 1ETH/token.
    function buyToken() public payable {
        balances[msg.sender] += msg.value / 1 ether;
    }

    /** @dev Send token.
     *  @param _recipient The recipient.
     *  @param _amount The amount to send.
     */
    function sendToken(address _recipient, uint _amount) public {
        // You must have enough tokens
        require(balances[msg.sender] >= amount);
        // Overflow
        require(balances[_recipient] + _amount >= balances[_recipient]);

        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
    }
}
