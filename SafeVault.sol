// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SafeVault {
    address public owner;

    event Deposit(address sender, uint256 amount);
    event Withdraw(uint256 amount);

    constructor() {
        owner = msg.sender; 
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function deposit() public payable {
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw() public {
        require(msg.sender == owner, "NOT YOUR MONEY, HONEY!");

        uint256 amount = address(this).balance;
        require(amount > 0, "No funds to withdraw");
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Transfer failed");
        emit Withdraw(amount);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
