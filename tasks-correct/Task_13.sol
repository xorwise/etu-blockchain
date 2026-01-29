// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleUsage {
    // Пример использования assert
    function assertExample(uint256 _value) public pure {
        // Проверяем, что _value не равен нулю
        assert(_value != 0);
    }

    // Пример использования revert
    function revertExample(bool _condition) public pure {
        // Если условие ложное — откатываем транзакцию
        if (!_condition) {
            revert("Invalid condition");
        }
    }

    // Пример использования if-else
    function ifElseExample(uint256 _value) public pure returns (string memory) {
        if (_value > 10) {
            return "Value is greater than 10";
        } else {
            return "Value is 10 or less";
        }
    }

    // Пример использования else if
    function elseIfExample(uint256 _value) public pure returns (string memory) {
        if (_value > 10) {
            return "Value is greater than 10";
        } else if (_value == 10) {
            return "Value is exactly 10";
        } else {
            return "Value is less than 10";
        }
    }

    // Пример использования тернарного оператора (переписан на if-else)
    function ternaryExample(uint256 _value) public pure returns (string memory) {
        if (_value > 10) {
            return "Value is greater than 10";
        } else {
            return "Value is 10 or less";
        }
    }

    /*
    Ответы на вопросы:
    1) assertExample: проверка _value != 0
    2) revertExample: revert при false
    3) ifElseExample: else -> "Value is 10 or less"
    4) elseIfExample: корректные сравнения >, ==, else
    5) ternaryExample переписана на if-else
    6) Ссылка на Task_13.sol (GitHub):
       https://github.com/xorwise/etu-blockchain/blob/main/tasks-correct/Task_13.sol
    */
}
