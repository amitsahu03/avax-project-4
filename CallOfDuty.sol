// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CallOfDuty is ERC20("CallOfDuty", "COD"), Ownable(msg.sender) {

    uint256 public currAmmo = 10;

    constructor() {
        _mint(msg.sender, currAmmo);
    }

    function buyAmmo(uint256 ammo) public onlyOwner {
        _mint(msg.sender, ammo);
    }

    function shootEnimies(uint256 enemy ) public onlyOwner{
        require(currAmmo>0, "not enough ammo");
        require(enemy>0,"enemy shot down must be greater than 0");

        currAmmo -= enemy;
        _burn(msg.sender,enemy);
    }

}
