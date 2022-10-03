// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

contract People {
    uint public countPerson = 0;
    mapping( address => Person ) public dataArr;

    enum Level {Beginer, Inter, Advance}

    struct Person {
        address walletAddress;
        string fullName;
        Level myLever;
        uint age;
        bool sex;
        uint createTime;
    }

    function addPerson(string memory fullName, uint age, bool sex ) public {
        dataArr[msg.sender]  =  Person(msg.sender,fullName, Level.Beginer ,age, sex, block.timestamp);
        countPerson += 1;
    }
    
    function getPlayerLevel(address addressPlayer) public view returns (Level) {
        return dataArr[addressPlayer].myLever;
    }

    function changePlayerLevel(address personAddress) public {
        Person storage person = dataArr[personAddress];
        if (block.timestamp >= person.createTime + 15) {
            person.myLever = Level.Inter;
        }
    }

}