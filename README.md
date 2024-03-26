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

### Installing

* How/where to download your program
* Any modifications needed to be made to files/folders

### Executing program

* How to run the program
* Step-by-step bullets
```
code blocks for commands
```

## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```

## Authors

Contributors names and contact info

ex. Dominique Pizzie  
ex. [@DomPizzie](https://twitter.com/dompizzie)


## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details
