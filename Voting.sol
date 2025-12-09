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
