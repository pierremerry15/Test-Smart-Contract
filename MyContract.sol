// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract MyToken is ERC20, ERC20Permit {
    address minner;

    constructor() ERC20("Staples", "SPL") ERC20Permit("Staples") {
        _mint(msg.sender, 1000 * 10**decimals());
        minner = msg.sender; 
    }

    function min(uint120 amount) public {
        require(msg.sender == minner, "Please do not min me");
        _mint(msg.sender, amount * 10**decimals());
    }
}