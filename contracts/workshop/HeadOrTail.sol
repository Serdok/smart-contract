// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract WrongHeadOrTail {
    bool public chosen; // True if head/tail has been chosen.
    bool lastChoiceHead; // True if the choice is head.
    address public lastParty; // The last party who chose.

    /** @dev Must be sent 1 ETH.
     *  Choose head or tail to be guessed by the other player.
     *  @param _chooseHead True if head was chosen, false if tail was chosen.
     */
    function choose(bool _chooseHead) public payable {
        require(!chosen);
        require(msg.value == 1 ether);

        chosen = true;
        lastChoiceHead = _chooseHead;
        lastParty = msg.sender;
    }


    function guess(bool _guessHead) public payable {
        require(chosen);
        require(msg.value == 1 ether);

        if (_guessHead == lastChoiceHead)
            payable(msg.sender).transfer(2 ether);
        else
            payable(lastParty).transfer(2 ether);

        chosen = false;
    }
}

contract HeadOrTail {
    bool public chosen; // True if head/tail has been chosen.
    bool lastChoiceHead; // True if the choice is head.
    address public lastParty; // The last party who chose.

    /** @dev Must be sent 1 ETH.
     *  Choose head or tail to be guessed by the other player.
     *  @param _chooseHead True if head was chosen, false if tail was chosen.
     */
    function choose(bool _chooseHead) public payable {
        require(!chosen);
        require(msg.value == 1 ether);

        chosen = true;
        lastChoiceHead = _chooseHead;
        lastParty = msg.sender;
    }


    function guess(bool _guessHead) public payable {
        require(chosen);
        require(msg.value == 1 ether);

        if (_guessHead == lastChoiceHead)
            payable(msg.sender).transfer(2 ether);
        else
            payable(lastParty).transfer(2 ether);

        chosen = false;
    }
}