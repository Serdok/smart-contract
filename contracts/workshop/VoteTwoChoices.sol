// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract WrongVoteTwoChoices {
    mapping(address => uint) public votingRights;
    mapping(address => uint) public votesCast;
    mapping(bytes32 => uint) public votesReceived;

    /// @dev Get 1 voting right per ETH sent.
    function buyVotingRights() public payable {
        votingRights[msg.sender] += msg.value / (1 ether);
    }

    /** @dev Vote with nbVotes for a proposition.
     *  @param _nbVotes The number of votes to cast.
     *  @param _proposition The proposition to vote for.
     */
    function vote(uint _nbVotes, bytes32 _proposition) public {
        // Check you have enough voting rights.
        require(_nbVotes + votesCast[msg.sender] <= votingRights[msg.sender]);

        votesCast[msg.sender] += _nbVotes;
        votesReceived[_proposition] += _nbVotes;
    }

}

contract VoteTwoChoices {
    mapping(address => uint) public votingRights;
    mapping(address => uint) public votesCast;
    mapping(bytes32 => uint) public votesReceived;

    /// @dev Get 1 voting right per ETH sent.
    function buyVotingRights() public payable {
        votingRights[msg.sender] += msg.value / (1 ether);
    }

    /** @dev Vote with nbVotes for a proposition.
     *  @param _nbVotes The number of votes to cast.
     *  @param _proposition The proposition to vote for.
     */
    function vote(uint _nbVotes, bytes32 _proposition) public {
        require(_nbVotes + votesCast[msg.sender] <= votingRights[msg.sender]);
        // Overflow
        require(votesCast[msg.sender] + _nbVotes >= votesCast[msg.sender]);
        require(votesReceived[_proposition] + _nbVotes >= votesReceived[_proposition]);


        votesCast[msg.sender] += _nbVotes;
        votesReceived[_proposition] += _nbVotes;
        // Decrease the voting power of the sender
        votingRights[msg.sender] -= _nbVotes;
    }

}