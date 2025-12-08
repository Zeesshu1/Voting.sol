# Voting.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    mapping(address => bool) public hasVoted;
    mapping(uint => uint) public votes; // proposalId => votes

    event Voted(address voter, uint proposalId);

    function vote(uint proposalId) external {
        require(!hasVoted[msg.sender], "Already voted");
        votes[proposalId]++;
        hasVoted[msg.sender] = true;
        emit Voted(msg.sender, proposalId);
    }

    function getVotes(uint proposalId) external view returns (uint) {
        return votes[proposalId];
    }
}
