// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_04 {
    mapping(address => uint256) public balances; // Маппинг адресов на балансы

    function setBalance(address _addr, uint256 _balance) external {
        balances[_addr] = _balance;
    }

    // Возвращаем баланс по адресу из mapping
    function getBalance(address _addr) public view returns (uint256) {
        return balances[_addr];
    }

    /*
    Ответы на вопросы:
    1) getBalance реализована выше
    2) Ссылка на Task_04.sol (GitHub):
       https://github.com/xorwise/etu-blockchain/blob/main/tasks-correct/Task_04.sol
    */
}
