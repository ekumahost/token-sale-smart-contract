var FarmToken = artifacts.require('FarmToken');

contract('FarmToken', function(accounts){


it('sets the total supply upon deployment', function(){

return FarmToken.deployed().then(function(instance){

tokenInstance = instance;
return tokenInstance.totalSupply();

}).then(function(totalSupply){
assert.equal(totalSupply.toNumber(), 100000000, "sets the total supply to 100m");

})

});

});