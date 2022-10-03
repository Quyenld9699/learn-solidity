// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

contract MyCoin {
    address public minter;
    mapping (address => uint) public balance;

    event Sent(address from, address to, uint amount);

    modifier onlyMinter {
        require(msg.sender == minter, "You are not host of coin");
        _;
    }
    modifier checkamount(uint amount) {
        require(amount < 1e60);
        _;
    }
    modifier checkEnoughtMoney (uint amount) {
        require(amount <= balance[msg.sender], "Khong du tien dau, nap them di!");
        _;
    }


    constructor() {
        minter = msg.sender;
    }

    function mint(address reciver, uint amount) public onlyMinter checkamount(amount){
        // require(msg.sender == minter, "You are not host of coin");
        // require(amount < 1e60);

        balance[reciver] += amount;
    }

    function send(address reciver, uint amount) public checkEnoughtMoney(amount) {
        // require(amount <= balance[msg.sender], "Khong du tien dau, nap them di!");

        balance[reciver] += amount;
        balance[msg.sender] -= amount;

        emit Sent(msg.sender, reciver, amount);
    }
}
