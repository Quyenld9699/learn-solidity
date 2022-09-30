// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

contract People {
    uint public countPerson = 0;
    mapping( address => Person ) public dataArr;

    struct Person {
        address walletAddress;
        string fullName;
        uint age;
        bool sex;
    }

    function addPerson(string memory fullName, uint age, bool sex ) public {
        dataArr[msg.sender]  =  Person(msg.sender,fullName, age, sex);
        countPerson += 1;
    }

}