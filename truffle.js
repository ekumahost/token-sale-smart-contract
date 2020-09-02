module.exports = {
// this file is used for config; truffle-config.js is the same thing, but used on windows only
// because of interfernece while running confi command in window
network : {

	development : {
		host: '127.0.0.1',
		port: '7545',
		network_id : '*' // match any network ID
	}
}

};