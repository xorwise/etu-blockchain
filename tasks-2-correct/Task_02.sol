// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Task_02 {
    // Функция для генерации массива квадратов чисел от 1 до n
    function generateSquares(uint256 n) public pure returns (uint256[] memory) {
        uint256[] memory squares = new uint256[](n);
        for (uint256 i = 0; i < n; i++) {
            uint256 value = i + 1;
            squares[i] = value * value;
        }
        return squares;
    }

    /*
    Ответы на вопросы:
    1) generateSquares реализована выше
    2) Ссылка на Task_02.sol (GitHub):
       https://github.com/xorwise/etu-blockchain/blob/main/tasks-2-correct/Task_02.sol
    */
}
