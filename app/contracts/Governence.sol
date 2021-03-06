pragma solidity ^0.6.6;

contract Governance {
    uint256 public one_time;
    address public client;
    address public randomness;
    address public owner;

    constructor() public {
        one_time = 1;
        owner = msg.sender;
    }

    function init(address _client, address _randomness) public {
        require(owner == msg.sender);
        require(_randomness != address(0), "governance/no-randomnesss-address");
        require(_client != address(0), "no-client-address-given");
        require(one_time > 0, "can-only-be-called-once");
        one_time = one_time - 1;
        randomness = _randomness;
        client = _client;
    }
}
