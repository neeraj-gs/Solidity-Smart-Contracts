// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract EventTicket{
    uint public numberofTickets;
    uint public ticketPrice;
    uint public totalAmount;
    uint public startAt;
    uint public endAt;
    uint public timeRange;
    string public message = "Buy Your First Event Ticket";

    constructor(uint _ticketPrice){
        ticketPrice=_ticketPrice;
        startAt=block.timestamp;
        endAt=block.timestamp + 7 days;
        timestamp=(endAt-startAt)/60/60/24; //in seconds
        
    }
}