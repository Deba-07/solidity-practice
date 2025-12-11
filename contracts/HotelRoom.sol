// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {
    // Ether payments, modifiers, visibility, events, enums

    enum Statuses {
        Vacant,
        Occupied
    }
    Statuses public currentStatus;

    event Occupy(address _occupant, uint _value);

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant() {
        // Check Status
        require(currentStatus == Statuses.Vacant, "Currently Occupied");
        _;
    }

    modifier costs(uint _amount) {
        // Check Price
        require(msg.value >= _amount, "Not enough ether provided");
        _;
    }

    function book() public payable onlyWhileVacant costs(2 ether) {
        currentStatus = Statuses.Occupied;
        //owner.transfer(msg.value);
        (bool sent, ) = owner.call{value: msg.value}("");
        require(sent, "Payment to owner failed");

        emit Occupy(msg.sender, msg.value);
    }
}
