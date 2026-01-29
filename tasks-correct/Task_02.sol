// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_02 {
    uint256[] public dynamicArray; // Динамический массив
    uint256[5] public fixedArray;  // Фиксированный массив из 5 элементов

    // Внешняя функция — удобно принимать данные через calldata
    function addToDynamicArray(uint256 _value) external {
        dynamicArray.push(_value);
    }

    // Сумма всех элементов динамического массива
    function sumArray() public view returns (uint256 sum) {
        // Читаем из storage, аккуратно поэлементно
        for (uint256 i = 0; i < dynamicArray.length; i++) {
            sum += dynamicArray[i];
        }
        return sum;
    }

    /*
    Ответы на вопросы:
    1) sumArray реализована выше
    2) Ссылка на Task_02.sol (GitHub):
       https://github.com/xorwise/etu-blockchain/blob/main/tasks-correct/Task_02.sol
    */
}
