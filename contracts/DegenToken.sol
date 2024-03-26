// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    
    string public itemstr;
    mapping(uint256 => uint256) public itemFrequency;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        itemstr="Items in my store are : 1.helmet  2.gloves  3.safety gear ";

        itemFrequency[1] = 5; 
        itemFrequency[2] = 5; 
        itemFrequency[3] = 5; 
    }

    function mint(address to_address, uint256 amt) public onlyOwner {
        _mint(to_address, amt);
    }

    function redeem(uint256 productId) public {
        require(balanceOf(msg.sender) >= 1500, "the least number of tokens can be 1500");
        assert(productId > 0 && productId <= 3); 

        uint256 tokensToBurn = 1500;
        _burn(msg.sender, tokensToBurn*productId);

        itemFrequency[productId]--;

   
    }

    function getItemFrequency(uint256 productId) public view returns (uint256) {
         assert(productId > 0 && productId <= 3); 
        return itemFrequency[productId];
    }
}
