pragma solidity >=0.4.21 <0.7.0;
// pragma solidity ^0.5.16; // our local truffle compiler version: is 0.5.16+commit.9c3226ce.Emscripten.clang


contract FarmToken{

// Constructor
// set total token
// get total token
// asign name
string public name = "FarmToken"; // getter for name
// asign symbol
string public symbol = "FARM"; 
string public standard = "FarmToken v1.0"; // we just added it, not part of ERC20 




event Transfer(

address indexed _from, 
address indexed _to,
uint256 _value

	);



// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
	uint256 public totalSupply; // storage >> state variable
	mapping(address => uint256) public balanceOf; // associative array, key value store, get the balance of token

	constructor (uint256 _initialSupply) public { // convention use _ to start local variables

        balanceOf[msg.sender] = _initialSupply; // msq is global keyword, sender is the adress that call this function
           
     	totalSupply = _initialSupply; // >> state variable, writes to disk in blockchain

     	// allocate the initial supply to a particular address 


   }


     // Transfer

     function transfer(address _to, uint256 _value) public returns (bool success) {
 // exception if account dont have enough balance.
       require(balanceOf[msg.sender] >= _value); // if condition is meet code continue.


    // tranfer balance
     balanceOf[msg.sender] -= _value;
     balanceOf[_to] += _value;


     // return true or fale
     // transfer event
     emit Transfer(msg.sender, _to, _value );

return true;

     }









}