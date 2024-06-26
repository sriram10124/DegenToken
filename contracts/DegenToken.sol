// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
//5th requirement- balanceOf
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {

string public itemstr;
mapping(uint256 => uint256) public itemFrequency; 

constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
    itemstr="Items in my store are : 1.helmet  2.gloves  3.safety gear ";
    itemFrequency[1] = 5; //5 helmets
    itemFrequency[2] = 5; //5 gloves
    itemFrequency[3] = 5; // 5 safety gears
}
//1st requirement - mint function
    function mint(address to_address, uint256 amt) public onlyOwner {
        _mint(to_address, amt);
    }
//3rd requirement - burn function 
    function burn(uint256 amt)public override{
        _burn(msg.sender, amt);
    }
//4th requirement - transfer function
    function transfer(address recepient,uint256 amt)public override returns(bool){
        _transfer(msg.sender, recepient, amt);
        return true;
    }
//2nd requirement - redeem function 
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
