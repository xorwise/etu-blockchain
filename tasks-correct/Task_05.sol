// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_05 {
    enum Status {
        Pending,
        Active,
        Inactive
    }

    Status public currentStatus; // Переменная типа Status

    function setStatus(Status _status) external {
        currentStatus = _status;
    }

    // Возвращаем текущее значение статуса как число (uint8)
    function getBalance() public view returns (uint8) {
        return uint8(currentStatus);
    }

    /*
    Ответы на вопросы:
    1) getBalance реализована выше
    2) Ссылка на Task_05.sol (GitHub):
       https://github.com/xorwise/etu-blockchain/blob/main/tasks-correct/Task_05.sol
    */
}
