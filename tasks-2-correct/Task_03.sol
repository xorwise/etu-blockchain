// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Task_03 {
    // Факториал через while: n! = 1 * 2 * ... * n
    function generateFactorial(uint256 n) public pure returns (uint256) {
        uint256 result = 1;
        uint256 i = 1;
        while (i <= n) {
            result *= i;
            i++;
        }
        return result;
    }

    /*
    Ответы на вопросы:
    1) generateFactorial реализована выше
    2) Ссылка на Task_03.sol (GitHub):
       https://github.com/xorwise/etu-blockchain/blob/main/tasks-2-correct/Task_03.sol
    */
}
