// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_11 {
    address public owner;
    uint public targetAmount;
    uint public totalUserDeposits;

    enum State {
        Active,
        Paused,
        Closed
    }
    State public state;

    mapping(address => uint) public balances;

    event Deposited(address indexed user, uint amount);
    event Withdrawn(address indexed user, uint amount);
    event StateChanged(State newState);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    modifier whenActiveOrPaused() {
        require(state == State.Active || state == State.Paused, "Unavailable in closed state");
        _;
    }

    modifier whenActive() {
        require(state == State.Active, "Contract is not active");
        _;
    }

    modifier whenClosed() {
        require(state == State.Closed, "Contract is not closed");
        _;
    }

    constructor(uint _targetAmount) {
        require(_targetAmount > 0, "Target amount should be > 0");
        owner = msg.sender;
        targetAmount = _targetAmount;
        state = State.Active;
    }

    function deposit() external payable whenActive {
        require(msg.value > 0, "Deposit must be > 0");
        balances[msg.sender] += msg.value;
        totalUserDeposits += msg.value;
        emit Deposited(msg.sender, msg.value);

        if (totalUserDeposits >= targetAmount) {
            state = State.Closed;
            emit StateChanged(state);
        }
    }

    function pause() external onlyOwner whenActiveOrPaused {
        require(state != State.Paused, "Contract paused");
        state = State.Paused;
        emit StateChanged(state);
    }

    function resume() external onlyOwner {
        require(state == State.Paused, "Contract is not paused");
        state = State.Active;
        emit StateChanged(state);
    }

    function withdraw() external {
        require(state == State.Paused, "Fund withdraw available only if paused");
        uint userBalance = balances[msg.sender];
        require(userBalance > 0, "No funds to withdraw");

        balances[msg.sender] = 0;
        totalUserDeposits -= userBalance;

        (bool success, ) = msg.sender.call{value: userBalance}("");
        require(success, "Transfer failed");
        emit Withdrawn(msg.sender, userBalance);
    }

    function ownerWithdrawAll() external onlyOwner whenClosed {
        uint contractBalance = address(this).balance;
        require(contractBalance > 0, "No fund to withdraw");

        balances[owner] = 0;
        totalUserDeposits = 0;

        (bool success, ) = owner.call{value: contractBalance}("");
        require(success, "Transfer failed");
    }

    function getState() external view returns (string memory) {
        if (state == State.Active) return "Active";
        if (state == State.Paused) return "Paused";
        if (state == State.Closed) return "Closed";
        return "";
    }

    /*
    Ответы на вопросы:
    1) totalUserDeposits учитывает сумму всех депозитов
    2) onlyOwner и whenClosed реализованы
    3) deposit/withdraw учитывают баланс, события и состояние
    4) Ссылка на Task_11.sol (GitHub):
       https://github.com/xorwise/etu-blockchain/blob/main/tasks-2-correct/Task_11.sol
    */
}
