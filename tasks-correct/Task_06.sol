// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_06 {
    uint256 public constant MAX_UINT = type(uint256).max; // Максимальное значение uint256

    function getMaxUint256() external pure returns (uint256) {
        return MAX_UINT;
    }

    // Максимальное значение для uint8
    function getMaxUint8() public pure returns (uint8) {
        return type(uint8).max; // 255
    }

    /*
    Ответы на вопросы:
    1) getMaxUint8 реализована выше
    2) Ссылка на Task_06.sol (GitHub):
       https://github.com/xorwise/etu-blockchain/blob/main/tasks-correct/Task_06.sol
    */
}
