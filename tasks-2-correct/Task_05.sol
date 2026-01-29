// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Task_05 {
    // Храним несколько температур в Цельсиях
    uint256[] public celsiusTemperatures; // storage

    // Добавляем температуру в массив
    function addCelsiusTemperature(uint256 temperature) public {
        celsiusTemperatures.push(temperature);
    }

    // Функция для конвертации градусов Цельсия в Фаренгейт
    function convertToFahrenheit(uint256 temperature) public pure returns (uint256) {
        uint256 fahrenheitTemperature = (temperature * 9 / 5) + 32;
        return fahrenheitTemperature;
    }

    // Возвращаем все температуры в Фаренгейтах
    function getAllFahrenheitTemperatures() public view returns (uint256[] memory) {
        uint256[] memory result = new uint256[](celsiusTemperatures.length);
        for (uint256 i = 0; i < celsiusTemperatures.length; i++) {
            result[i] = convertToFahrenheit(celsiusTemperatures[i]);
        }
        return result;
    }

    /*
    Ответы на вопросы:
    1) celsiusTemperatures — динамический массив в storage
    2) getAllFahrenheitTemperatures реализована выше
    3) Ссылка на Task_05.sol (GitHub):
       https://github.com/xorwise/etu-blockchain/blob/main/tasks-2-correct/Task_05.sol
    */
}
