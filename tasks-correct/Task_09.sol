// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_09 {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Пример 3: Работа с фиксированным массивом байтов
    // Фиксированный массив bytes1[4] — массив из 4 байтов фиксированной длины
    // Функция возвращает сумму всех байтов (приведённых к uint8)
    function getFixedByteArraySum(bytes1[4] memory _data) public pure returns (uint8) {
        uint8 sum = 0;
        for (uint8 i = 0; i < _data.length; i++) {
            sum += uint8(_data[i]);
        }
        return sum;
    }

    // Среднее арифметическое всех байтов фиксированного массива
    function getFixedByteArrayAverage(bytes1[4] memory _data) public pure returns (uint8) {
        uint8 sum = getFixedByteArraySum(_data);
        return sum / uint8(_data.length);
    }

    /*
    Ответы на вопросы:
    1) getFixedByteArrayAverage реализована выше
    2) Ссылка на Task_09.sol (GitHub):
       https://github.com/xorwise/etu-blockchain/blob/main/tasks-correct/Task_09.sol
    */
}
