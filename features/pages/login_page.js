var login_page = function(){

	var txtUserName = element(by.css('input#username'));
	var continueBtn = element(by.xpath('//a[@id="continuebutton"]'));
	var txtPassword = element(by.css('input#password'));
	var btnSignIn = element(by.css('button#login'));
	var logOut = element(by.xpath('//a[@id=\'logout\']'));
	var txtibmuserName = element(by.xpath('//input[@name="username"]'));
	var txtibmpassword = element(by.xpath('//input[@name="password"]'));
	var btnIbmSignIn = element(by.xpath('//button[@id="btn_signin"]'));

	this.enterUserName = function(value){
		browser.wait(browser.ExpectedConditions.visibilityOf(txtUserName),20000);
		txtUserName.sendKeys(value);
	};

	this.enterPassword = function(value){
		browser.wait(browser.ExpectedConditions.visibilityOf(txtPassword),20000);
		txtPassword.sendKeys(value);
	};
	this.clickContinue = function(){
		browser.wait(browser.ExpectedConditions.visibilityOf(continueBtn),20000);
		continueBtn.click();
	};

	this.IbmUserName = function(value){
		browser.wait(browser.ExpectedConditions.visibilityOf(txtibmuserName),20000);
		txtibmuserName.sendKeys(value);
	};

	this.IbmPassword = function(value){
		browser.wait(browser.ExpectedConditions.visibilityOf(txtibmpassword),20000);
		txtibmpassword.sendKeys(value);
	};

	this.waitForIbmLogin = function(){
		//browser.wait(browser.ExpectedConditions.visibilityOf(txtibmuserName),20000);
		
		browser.wait(function(){
								browser.sleep(20000);
    							return txtibmuserName.isDisplayed();
    							}, 20*1000);
	};

	this.waitAfterIbmLogin = function(){
		//browser.wait(browser.ExpectedConditions.visibilityOf(txtibmuserName),20000);
		
		browser.sleep(25000);
    	
	};

	this.clickIbmSignIn = function(){
		browser.wait(browser.ExpectedConditions.visibilityOf(btnIbmSignIn),20000);
		btnIbmSignIn.click();
	};

	this.SignInToIbmW3 = function(userName,Password){
		browser.sleep(20000);
		browser.wait(browser.ExpectedConditions.visibilityOf(txtibmuserName),50000);
		txtibmuserName.sendKeys(userName);
		txtibmpassword.sendKeys(Password);
		btnIbmSignIn.click();
		browser.sleep(30000);
	}



	this.clickSignIn = function(){
		btnSignIn.click();
		browser.waitForAngularEnabled(false);
		browser.wait(browser.ExpectedConditions.titleContains('Artifactory'), 60000);
		return require('./home_page.js');
	};

};
module.exports = new login_page();
