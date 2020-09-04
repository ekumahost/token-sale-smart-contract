const FarmToken = artifacts.require("FarmToken");

module.exports = function(deployer) {
  deployer.deploy(FarmToken, 1000000); // arguments passed here is passed to constructor function when we run



};
