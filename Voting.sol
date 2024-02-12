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
        uint voteCandidateId;
        address voterAddress;
    }
}