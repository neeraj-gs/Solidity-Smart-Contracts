//SPDX License Identifier: MIT
pragma solidity ^0.8.0;

//Voting Smart Contract

contract Vote{
    address electionCommision;
    address public winner;

    struct Voter{
        string name;
        uint age;
        uint voterId;
        string gender;
        uint voteCandidateId; //the person to whom voter has voted
        address voterAddress;
    }

    struct Candidate{
        string name;
        string party;
        uint age;
        string gender;
        uint candidateId;
        address candidateAddress;
        uint votes;
    }

    uint nextVoterId = 1; //Voted Id for Each Voter, initially started with 1
    uint candidateId = 1; //Candidate Id for candidates

    uint startTime;
    uint endTime;

    mapping (uint => Voter) voterDetails; //Details of voters
    mapping (uint => Candidate) candidateDetails;
    bool stopVoting; //this is for some emergency situation to stop election


    constructor(){
        electionCommision=msg.sender; //assigning deployer as teh election commisoin
    }
    
}