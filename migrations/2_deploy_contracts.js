const FarmToken = artifacts.require("FarmToken");

module.exports = function(deployer) {
  deployer.deploy(FarmToken, 100000000); // arguments passed here is passed to constructor function when we run



};
