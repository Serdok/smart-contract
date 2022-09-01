// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract WrongStore {
    struct Safe {
        address owner;
        uint amount;
    }

    Safe[] public safes;

    /// @dev Store some ETH.
    function store() public payable {
        safes.push(Safe({owner : msg.sender, amount : msg.value}));
    }

    /// @dev Take back all the amount stored.
    function take() public {
        for (uint i; i < safes.length; ++i) {
            Safe memory safe = safes[i];
            if (safe.owner == msg.sender && safe.amount != 0) {
                payable(msg.sender).transfer(safe.amount);
                safe.amount = 0;
            }
        }
    }
}

contract Store {
    mapping(address => uint) public safes;

    /// @dev Store some ETH.
    function store() public payable {
        safes[msg.sender] += msg.value;
    }

    /// @dev Take back all the amount stored.
    function take() public {
        msg.sender.transfer(safes[msg.sender]);
        safes[msg.sender] = 0;
    }
}