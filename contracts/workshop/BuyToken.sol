// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract WrongBuyToken {
    mapping(address => uint) public balances;
    uint public price = 1;
    address public owner = msg.sender;

    /** @dev Buy tokens.
     *  @param _amount The amount to buy.
     *  @param _price  The price to buy those in ETH.
     */
    function buyToken(uint _amount, uint _price) public payable {
        // The price is at least the current price.
        require(_price >= price);
        // You have paid at least the total price.
        require(_price * _amount * 1 ether <= msg.value);
        balances[msg.sender] += _amount;
    }

    /** @dev Set the price, only the owner can do it.
     *  @param _price The new price.
     */
    function setPrice(uint _price) public {
        require(msg.sender == owner);

        price = _price;
    }
}

contract BuyToken {
    mapping(address => uint) public balances;
    uint public price = 1;
    address public owner = msg.sender;

    /** @dev Buy tokens.
     *  @param _amount The amount to buy.
     *  @param _price  The price to buy those in ETH.
     */
    function buyToken(uint _amount, uint _price) public payable {
        // The price is at least the current price.
        require(_price >= price);
        // You have paid at least the total price.
        require(_price * _amount * 1 ether <= msg.value);

        balances[msg.sender] += _amount;
    }

    /** @dev Set the price, only the owner can do it.
     *  @param _price The new price.
     */
    function setPrice(uint _price) public {
        require(msg.sender == owner);

        price = _price;
    }
}