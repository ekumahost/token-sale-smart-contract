var FarmToken = artifacts.require('FarmToken');

contract('FarmToken', function(accounts){
var tokenInstance;




it('initialize contract with correct name and symbol', function(){

	return FarmToken.deployed().then(function(instance){

	tokenInstance = instance;
	return tokenInstance.name();

	}).then(function(name){
		assert.equal(name, "FarmToken", "correct name set");

	 return tokenInstance.symbol();


	}).then(function(symbol){

		assert.equal(symbol, "FARM", "we have right symbol");

	 return tokenInstance.standard();


	}).then(function(standard){

		assert.equal(standard, "FarmToken v1.0", "have correct standard");

	});
});








it('allocates initial supply upon deployment', function(){

	return FarmToken.deployed().then(function(instance){

	tokenInstance = instance;
	return tokenInstance.totalSupply();

	}).then(function(totalSupply){
		assert.equal(totalSupply.toNumber(), 100000000, "sets the total supply to 100m");

	 

	 return tokenInstance.balanceOf(accounts[0]);


	}).then(function(adminBalance){

		assert.equal(adminBalance.toNumber(), 100000000, "initial supply to admin account 100m");

	});

});









it('transfers token ownership', function(){

	return FarmToken.deployed().then(function(instance){

	tokenInstance = instance;
	// tranfer something larger by sender balance for test..
	return tokenInstance.transfer.call(accounts[0], 99999999999999999999999);

	}).then(assert.fail).catch(function(error){

     assert(error.message.indexOf('revert') >= 0, 'error message must contain revert');


     return tokenInstance.transfer.call(accounts[1], 25000000, {from: accounts[0] });


       }).then(function(success){

         assert.equal(success, true, 'it return sucess');


         return tokenInstance.transfer.call(accounts[1], 25000000, {from: accounts[0] });
     

	}).then(function(receipt){

return tokenInstance.balanceOf(accounts[1]);

     // test for transfer event fire
     assert.equal(receipt.logs.length, 1, 'triggers on event');
     assert.equal(receipt.logs[0].event, "Transfer", 'should be "Transfer" event');
     assert.equal(receipt.logs[0].args._from, accounts[0], 'logs the account sending funds');
     assert.equal(receipt.logs[0].args._to, accounts[1], 'logs the account receiving funds');
     assert.equal(receipt.logs[0].args._value, 25000000, 'logs the transfer amount');



	}).then(function(balance){

		assert.equal(balance.toNumber(), 25000000, "tranfer done!!");

	return tokenInstance.balanceOf(accounts[0]);


	}).then(function(balance){

		assert.equal(balance.toNumber(), 75000000, "balance deducted");

	});
});










});