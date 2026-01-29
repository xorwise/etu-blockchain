// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Task_04 {
    // Находим первое число Фибоначчи, строго большее n
    function generateFibo(uint256 n) public pure returns (uint256) {
        uint256 a = 0;
        uint256 b = 1;
        uint256 c;
        do {
            c = a + b;
            a = b;
            b = c;
        } while (b <= n);
        return b;
    }

    /*
    Ответы на вопросы:
    1) generateFibo реализована выше
    2) Ссылка на Task_04.sol (GitHub):
       https://github.com/xorwise/etu-blockchain/blob/main/tasks-2-correct/Task_04.sol
    */
}
