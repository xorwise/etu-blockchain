// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_03 {
    struct Person {
        string name;
        uint8 age;
    }

    Person[] public people; // Массив структур в storage

    function addPerson(string memory _name, uint8 _age) external {
        people.push(Person(_name, _age));
    }

    // Возвращаем имя и возраст по индексу
    function getUser(uint256 _index) public view returns (string memory name, uint8 age) {
        require(_index < people.length, "Index out of bounds.");
        Person storage person = people[_index];
        return (person.name, person.age);
    }

    /*
    Ответы на вопросы:
    1) getUser реализована выше
    2) Ссылка на Task_03.sol (GitHub):
       https://github.com/xorwise/etu-blockchain/blob/main/tasks-correct/Task_03.sol
    */
}
