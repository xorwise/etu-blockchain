// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Task_01 {
    // Функция для вычисления суммы с использованием цикла for
    function calculateSumFor(uint256 n) public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 1; i <= n; i++) {
            sum += i;
        }
        return sum;
    }

    // Функция для вычисления суммы с использованием цикла while
    function calculateSumWhile(uint256 n) public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 1;
        while (i <= n) {
            sum += i;
            i++;
        }
        return sum;
    }

    // Функция для вычисления суммы с использованием цикла do while
    function calculateSumDoWhile(uint256 n) public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 1;
        do {
            sum += i;
            i++;
        } while (i <= n);
        return sum;
    }

    /*
    Ответы на вопросы:
    1) По замерам газа на одинаковых входных данных различия минимальны.
       For/while компилируются в очень похожий байткод. Do-while может
       дать лишнюю итерацию при n = 0 (обязательное выполнение тела).
    2) Больше газа потребляет: Одинаково
    3) Меньше газа потребляет: Одинаково
    */
}
