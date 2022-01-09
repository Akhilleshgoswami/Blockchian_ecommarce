// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC20/IERC20.sol)

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract Usdc is ERC20 {

    constructor ()  ERC20("Usdc Stable Coin","USDC")public {
        
    }

    function faucet(address to , uint amount) external{
    _mint(to,amount);
    }
}