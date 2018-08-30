#features/search.feature
Feature: Verifying Unified Portal Login with in-valid data
    As a user
    I should not be able to Login in to Unified Portal
    
        
    Scenario: Unified Portal Login
        Given I will navigate unified portal url "https://managed-solutions.bluemix.net/managed-solutions/#/" in "firefox" browser
        Then Unified Portal Login Page should be displayed
        When I enter "udondapa" as user name in Enter IBMid text field
        Then I click on Continue button
        When It will navigate to IBMW3 Login Home page in order to validate User Cerdentials
        Then I enter "udondapa" as user name in IBM email address Text field
        Then I enter "Maya201" as password in Password Text field
        When I click on SignIn button
        Then It will not display unified portal Home page with all manditatory tabs
        