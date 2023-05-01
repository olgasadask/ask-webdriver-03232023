#ASK test scenarious

@asktest
Feature: ASK test scenarious
  @askteststudent
  Scenario: student login
    Given I open url "http://ask-int.portnov.com"
    Then I should see page title as "Assessment Control @ Portnov"
    And I type "gacenkomixannik@wantwp.com" into element with xpath "//input[@formcontrolname='email']"
    Then I type "Test123" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'STUDENT')]" to be present
