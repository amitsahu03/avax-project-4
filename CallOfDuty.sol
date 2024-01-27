// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CallOfDuty is ERC20("CallOfDuty", "COD"), Ownable(msg.sender) {

    uint256 public currAmmo = 10;
    mapping(address =>uint256 ) prize;
    mapping(address =>bool ) prizeRedeemed;

    constructor() {
        _mint(msg.sender, currAmmo);
    }

    function buyAmmo(uint256 ammo) public  {
        _mint(msg.sender, ammo);
        currAmmo += ammo;
    }

    function shootEnimies(uint256 enemy ) public {
        require(currAmmo>0, "not enough ammo");
        require(enemy>0,"enemy shot down must be greater than 0");

        currAmmo -= enemy;
        _burn(msg.sender,enemy);
    }

    function addPrizes(address addr,uint256 prz) public onlyOwner{
        prize[addr] = prz;
        prizeRedeemed[addr] = false;
    }

    function redeemPrizes() public {
        require(!prizeRedeemed[msg.sender],"prize already redeemed");
        prizeRedeemed[msg.sender] = true;
    }

}
