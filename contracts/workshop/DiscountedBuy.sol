// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract WrongDiscountedBuy {
    uint public basePrice = 1 ether;
    mapping(address => uint) public objectBought;

    /// @dev Buy an object.
    function buy() public payable {
        require(msg.value * (1 + objectBought[msg.sender]) == basePrice);
        objectBought[msg.sender] += 1;
    }

    /** @dev Return the price you'll need to pay.
     *  @return price The amount you need to pay in wei.
     */
    function price() public view returns (uint) {
        return basePrice / (1 + objectBought[msg.sender]);
    }
}

contract DiscountedBuy {
    uint public basePrice = 1 ether;
    mapping(address => uint) public objectBought;

    /// @dev Buy an object.
    function buy() public payable {
        require(msg.value * (1 + objectBought[msg.sender]) == basePrice);
        objectBought[msg.sender] += 1;
    }

    /** @dev Return the price you'll need to pay.
     *  @return price The amount you need to pay in wei.
     */
    function price() public view returns (uint) {
        return basePrice / (1 + objectBought[msg.sender]);
    }
}