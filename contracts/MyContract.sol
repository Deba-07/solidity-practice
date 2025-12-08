// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MyContract{
    // state variable
    uint public myNum = 10;
    int myInt = -10;
    string public myString = "Hello World!!";
    bytes32 public myBytes = "Hello";
    address public myAddress = 0x694AA1769357215DE4FAC081bf1f309aDC325306;

    // custom dataType
    struct myStruct {
        uint256 myUint256;
        string myString;
    }
    myStruct public myData = myStruct(10, "Hello");

    // Local variable
    function getValue() public pure returns(uint) {
        uint value = 1;
        return value;
    }

    // Arrays
    uint[] public uintArray = [1, 2, 3];
    string[] public stringArray = ["aaa", "bbb", "ccc"];
    string[] public values;

    function addValue(string memory _value) public {
        values.push(_value);
    }

    function valueCount() public view returns(uint){
        return values.length;
    }
}