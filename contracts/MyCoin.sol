// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

contract MyCoin {
    address public minter;
    mapping (address => uint) public balance;

    event sent(address from, address to, uint amount);

    constructor() {
        minter = msg.sender;
    }

    function mint(address reciver, uint amount) public {
        require(msg.sender == minter, "You are not host of coin");
        require(amount < 1e60);

        balance[reciver] += amount;
    }

    function send(address reciver, uint amount) public {
        require(amount <= balance[msg.sender], "Khong du tien dau, nap them di!");

        balance[reciver] += amount;
        balance[msg.sender] -= amount;
    }
}
