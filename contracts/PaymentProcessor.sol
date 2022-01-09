// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC20/IERC20.sol)

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract PaymentProcessor {
    // address of the admin
    address public admin;
    IERC20 public usdc;
    event PaymentDone(
        address payer,
        uint256 amount,
        uint256 paymentId,
        uint256 data
    );

    constructor(address adminAddress, address udscAddress) public {
        admin = adminAddress;
        usdc = IERC20(udscAddress);
    }

    function pay(uint256 _amount, uint256 _paymentId) external {
        usdc.transferFrom(msg.sender, admin, _amount);

        emit PaymentDone(msg.sender, _amount, _paymentId, block.timestamp);
    }
}
