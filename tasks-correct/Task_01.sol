// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_01 {
    // Константа в байткоде не занимает storage
    uint256 public constant MAX_USERS = 100;

    // Перечисление ролей пользователя
    enum UserRole {
        Admin,
        User,
        Guest
    }

    // Ключевая структура, с которой работает контракт
    struct UserInfo {
        address userAddress;
        uint256 balance;
        string name;
        UserRole role;
    }

    // Храним пользователей в mapping (storage)
    mapping(address => UserInfo) private users;
    // Отдельный список адресов, чтобы вернуть всех пользователей
    address[] private userAddresses;

    // Добавление пользователя
    function addUser(address _userAddress, string calldata _name, UserRole _role) public {
        require(userAddresses.length < MAX_USERS, "Max users limit reached.");
        require(users[_userAddress].userAddress == address(0), "User already exists.");

        users[_userAddress] = UserInfo({
            userAddress: _userAddress,
            balance: 0,
            name: _name,
            role: _role
        });
        userAddresses.push(_userAddress);
    }

    // Получение пользователя: storage -> memory
    function getUser(address _userAddress) public view returns (UserInfo memory) {
        return users[_userAddress];
    }

    // Обновление баланса пользователя
    function updateBalance(address _userAddress, uint256 _newBalance) public {
        require(users[_userAddress].userAddress != address(0), "User does not exist.");
        users[_userAddress].balance = _newBalance;
    }

    // Возвращаем все адреса пользователей (storage -> memory)
    function getAllUsers() public view returns (address[] memory) {
        return userAddresses;
    }

    // Пример external + calldata
    function getUserInfo(address _userAddress) external view returns (UserInfo memory userInfo) {
        userInfo = users[_userAddress];
        return userInfo;
    }

    // Сортировка массива адресов из calldata (копируем в memory)
    function returnSortedAddresses(address[] calldata addresses) external pure returns (address[] memory) {
        address[] memory sortedAddresses = new address[](addresses.length);
        for (uint256 i = 0; i < addresses.length; i++) {
            sortedAddresses[i] = addresses[i];
        }

        // Пузырьковая сортировка, O(n^2)
        for (uint256 i = 0; i < sortedAddresses.length; i++) {
            for (uint256 j = 0; j + 1 < sortedAddresses.length; j++) {
                if (sortedAddresses[j] > sortedAddresses[j + 1]) {
                    address temp = sortedAddresses[j];
                    sortedAddresses[j] = sortedAddresses[j + 1];
                    sortedAddresses[j + 1] = temp;
                }
            }
        }

        return sortedAddresses;
    }

    // Внутренняя проверка существования пользователя
    function userExists(address _userAddress) internal view returns (bool) {
        return users[_userAddress].userAddress != address(0);
    }

    // Удаление пользователя из mapping и массива адресов
    function deleteUser(address _userAddress) private {
        require(userExists(_userAddress), "User does not exist.");
        delete users[_userAddress];
        for (uint256 i = 0; i < userAddresses.length; i++) {
            if (userAddresses[i] == _userAddress) {
                userAddresses[i] = userAddresses[userAddresses.length - 1];
                userAddresses.pop();
                break;
            }
        }
    }

    // Вопрос про арифметику в ^0.8.0: overflow вызывает revert
    uint8 public count;
    uint8 public a;

    constructor() {
        count = 255; // максимум для uint8
        a = 0;
    }

    function increment() public {
        // При 255 + 1 произойдет overflow и revert
        count += 1;
    }

    function sum(uint8 x) public returns (uint8) {
        a = x;
        // Вызываем increment, чтобы показать поведение overflow
        increment();
        return a;
    }

    /*
    Ответы на вопросы (задача 1):
    1) Лицензия: MIT
    2) address в UserInfo: userAddress
    3) uint в UserInfo: balance
    4) string в UserInfo: name
    5) getAllUsers(): пустой массив []
    6) sum(1) -> revert (overflow в increment), a остается прежним (0)

    Ответы на вопросы (задача 2):
    1) public функция: addUser
    2) private функция: deleteUser
    3) external функция: getUserInfo
    4) string в UserInfo: name
    5) getAllUsers(): пустой массив []
    6) Некорректный адрес -> Error encoding arguments: TypeError: invalid address
    */
}
