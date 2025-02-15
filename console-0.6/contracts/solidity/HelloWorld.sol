pragma solidity>=0.4.24 <0.6.11;

contract HelloWorld {
    string name;

    constructor() public {
        name = "Hello, World!";
    }

    function get(int[] memory a) public view returns (string memory) {
        return name;
    }

    function set(string memory n) public {
        name = n;
    }
}
