// Step definitions

var pasLogin = require('../pages/login_page.js');
var portalLogin = require('../pages/login_page.js');
var homePage = require('../pages/home_page');
var {defineSupportCode} = require('cucumber');

defineSupportCode(function({Given, When, Then, And}) {

	Given(/^I will navigate portal url "([^"]*)" in "([^"]*)" browser$/, function(url,browser,done){
		console.log(url+browser);
		done();
	});

	
	
});
