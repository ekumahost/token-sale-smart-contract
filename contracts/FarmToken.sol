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


event Approval(
    address indexed _owner,
    address indexed _spender,
    uint256 _value

	);




     // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
	uint256 public totalSupply; // storage >> state variable
	mapping(address => uint256) public balanceOf; // associative array, key value store, get the balance of token
	mapping(address => mapping(address => uint256)) public allowance;  // public variable instead of function: so we can keep track of approvals == >> mapping(address => uint256)


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

// tranfer function test not passing yet, sayiing no event was fired...

        return true;

     }



// approve
     function approve(address _spender, uint256 _value) public returns (bool success) {



           allowance[msg.sender][_spender] = _value;

// emit Approval
    emit Approval(msg.sender, _spender, _value );
    return true;


     	}







// Deletgated Transfer from one account to another without the sender initiating it..


// tansfer from

function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){

// user to user transfer

// require _from has enough token

require (_value <= balanceOf[_from]);


// require allowance is big enough 
require (_value <= allowance[_from][msg.sender]);

// change balance
     balanceOf[_from] -= _value;
     balanceOf[_to] += _value;


// update allowance
allowance[_from][msg.sender] -= _value;


// transfer event
emit Transfer(_from, _to,_value);

// return true.

return true;

}









}