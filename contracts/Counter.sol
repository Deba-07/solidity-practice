// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Counter {
    uint256 public count;

    // By the help of constructor we can give a default value to the count
    // constructor() {
    //     count = 0;
    // }

    // Don't this function as we have public identifier to the count variable
    // function getCount() public view returns(uint){
    //     return count;
    // }

    function incrementConut() public{
        count++;
    }
}