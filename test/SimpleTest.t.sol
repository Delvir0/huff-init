// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract SimpleTest is Test {
    uint public test;
    ERC20Huff public erc20huff;

    function setUp() public {
        erc20huff = ERC20Huff(HuffDeployer.deploy("ERC20Huff"));
    }

    function testStoreV() public {
        erc20huff.storeValue(address(this), 2);
        erc20huff.getValue(0);
        erc20huff.getValue(1);
    }

    function testMint() public {
        erc20huff.mint(address(this), 2);
        console.log(erc20huff.getBalance(address(this)));
    }



}

interface ERC20Huff {
    function storeValue(address, uint32) external;
    function getValue(uint256) external returns(bytes32);
    function mint(address, uint256) external;
    function getBalance(address) external returns(uint256);
}