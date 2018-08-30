var home_page = function(){

	var lnkCompute = element(by.css('span.compute_default'));
	var rowHeader = element(by.className('row-title'));
	var iconUser = element(by.xpath('//div[contains(@class,\'user-header\')]//a'));
	var lnkSignOut = element(by.xpath('//div[@id="global-info-bar"]//div[@id="signout"]/a'));
	var logOut = element(by.xpath('//a[@id=\'logout\']'));

	this.clickCompute = function(){
		browser.wait(browser.ExpectedConditions.visibilityOf(lnkCompute),20000);
		lnkCompute.click();
		browser.wait(browser.ExpectedConditions.titleContains('Compute'), 60000);
		browser.wait(browser.ExpectedConditions.visibilityOf(rowHeader),20000);
		return require ('./compute/compute_page.js');
	};


	this.clickUserIcon = function(){
		//var userIcon = element(by.xpath('//div[contains(@class,\'user-header\')]//a[cotains(text(),\''+user+'\']'));
		browser.wait(browser.ExpectedConditions.visibilityOf(logOut),600000);
		logOut.click();
		return require ('./home_page.js');
	};

	this.clickSignOut = function(){
		browser.wait(browser.ExpectedConditions.visibilityOf(lnkSignOut),20000);
		lnkSignOut.click();
		return require ('./login_page.js');
	};
};
module.exports = new home_page();
