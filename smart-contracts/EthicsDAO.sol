// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EthicsDAO {
    struct Proposal {
        uint id;
        string description;
        uint voteCount;
    }

    Proposal[] public proposals;

    mapping(address => mapping(uint => bool)) public votes; // address => proposalId => voted

    function createProposal(string memory description) public {
        proposals.push(Proposal(proposals.length + 1, description, 0));
    }

    function vote(uint proposalId) public {
        require(proposalId > 0 && proposalId <= proposals.length, "Invalid proposal");
        require(!votes[msg.sender][proposalId], "Already voted");

        proposals[proposalId - 1].voteCount += 1;
        votes[msg.sender][proposalId] = true;
    }

    function getProposal(uint proposalId) public view returns (Proposal memory) {
        return proposals[proposalId - 1];
    }
}