## DegenToken

## Overview:
Writing a contract for making a degen token which helps us to perform basic function and keep track of inventory in my store.

## Description:
- Contract Inheritance: The contract inherits from ERC20, ERC20Burnable, and Ownable.

- State Variables:

- itemstr: A string variable storing a description of items available in the store.
- itemFrequency: A mapping to keep track of the frequency of each item. It maps the product ID to the remaining quantity of that item.
- Constructor: Sets the initial state of the contract. It initializes the token name and symbol and sets the deployer of the contract as the owner. Additionally, it initializes the itemstr and populates the itemFrequency mapping with initial quantities for three items: helmet, gloves, and safety gear.

- mint() Function: A function that allows the owner to mint new tokens and assigns them to a specified address.

- redeem() Function: A function that allows users to redeem items using their tokens. To redeem an item, the user must have at least 1500 tokens in their balance. The function burns 1500 tokens multiplied by the product ID from the sender's balance and decreases the frequency of the redeemed item.

- getItemFrequency() Function: A view function that returns the remaining quantity of a specified item based on its product ID.

## Getting Started

### Executing program
Remix IDE can be used to run this code.Follow this link :- https://remix.ethereum.org/.
Create a new file with the name 'DegenToken' and save the file with a .sol extension (e.g., DegenToken.sol). Paste the code given below in the file.
Code: 
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


# Running the program:
- Compile the code using the solidity compiler 'DegenToken.sol' in Remix IDE.
- Deploy the contract at the owner address using the 'deploy' function of Remix IDE
- execute the functions like mint,burn,redeem,transfer,etc

  NOTE: The above program can only be run in remix when compiler is set to "0.8.9" 

In order to deploy this contract onto the avalanche fuji testnet, try running this command:

-- npx hardhat run/scripts/deploy.js --network fuji
In order to verify the contract address , try running this command:

npx hardhat verify {address} --network fuji

## Authors

Contributors names and contact info

ex. Dominique Pizzie  
ex. [@DomPizzie](https://twitter.com/dompizzie)


## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details
