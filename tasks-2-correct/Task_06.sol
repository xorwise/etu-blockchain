// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_06 {
    mapping(uint256 => string) private colors;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
        colors[0] = "Red";
        colors[1] = "Orange";
        colors[2] = "Yellow";
        colors[3] = "Green";
        colors[4] = "Blue";
        colors[5] = "Indigo";
        colors[6] = "Violet";
    }

    // Добавляет цвет по индексу
    function addColor(uint256 index, string memory color) public {
        colors[index] = color;
    }

    // Возвращает цвет по индексу
    function getColor(uint256 index) public view returns (string memory) {
        return colors[index];
    }

    // Возвращает массив всех 7 цветов
    function getAllColors() public view returns (string[] memory) {
        string[] memory allColors = new string[](7);
        for (uint256 i = 0; i < 7; i++) {
            allColors[i] = colors[i];
        }
        return allColors;
    }

    // Проверяет существование цвета по индексу
    function colorExists(uint256 index) public view returns (bool) {
        if (index > 6) {
            return false;
        }
        return bytes(colors[index]).length > 0;
    }

    // Удаляет цвет по индексу
    function removeColor(uint256 index) public onlyOwner {
        delete colors[index];
    }

    /*
    Ответы на вопросы:
    1) Исправлены visibility, view и memory в add/get/getAll/colorExists
    2) removeColor защищена onlyOwner
    3) Ссылка на Task_06.sol (GitHub):
       https://github.com/xorwise/etu-blockchain/blob/main/tasks-2-correct/Task_06.sol
    */
}
