# Test automation for Quote application
# https://skryabin.com/market/quote.html
# Author: Olga Sadomskaia

@quote
Feature: Quote Test Scenarios

  Background:
    Given I open url "https://skryabin.com/market/quote.html"
    Then I resize window to 1920 and 1080
  @quote1
  Scenario: Validate Location address
      #Validate location address with different window size/example of responsive design testing
      # Given I open url "https://skryabin.com/market/quote.html"
      # Then I resize window to 1920 and 1080
      #desctop mode
    Then element with xpath "//b[@id='location']" should be displayed
    Then element with xpath "//b[@id='location']" should contain text "Los Altos, CA 94022"
    Then I resize window to 375 and 677
      #phone mode
    Then element with xpath "//b[@id='location']" should not be displayed

  @quote2
  Scenario: Verify Username field
        #Verify that 2 or more characters are allowed as Username and Username should not be empty.
        # Given I open url "https://skryabin.com/market/quote.html"
        # Then I resize window to 1920 and 1080
    Then element with xpath "//input[@name='username']" should be present
    And I type "A" into element with xpath "//input[@name='username']"
    And I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='username-error']" should contain text "Please enter at least 2 characters."
    Then I clear element with xpath "//input[@name='username']"
    Then element with xpath "//label[@id='username-error']" should contain text "This field is required."
    And I type "ABC" into element with xpath "//input[@name='username']"
    And I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='username-error']" should not be displayed
  @quote3
  Scenario: Verify name field
        #Verify that Name field properly display the input from Name pop up window fields.
    Then I click on element with xpath "//input[@id='name']"
    Then element with xpath "//input[@id='firstName']" should be displayed
    And I type "first" into element with xpath "//input[@id='firstName']"
    Then element with xpath "//input[@id='middleName']" should be displayed
    And I type "middle" into element with xpath "//input[@id='middleName']"
    Then element with xpath "//input[@id='lastName']" should be displayed
    And I type "last" into element with xpath "//input[@id='lastName']"
    Then I click on element with xpath "//span[contains(text(),'Save')]"
    Then element with xpath "//input[@id='name']" should be present
    Then element with xpath "//input[@id='name']" should have attribute "value" as "first middle last"

     #data driven scenario
  @quote4
  Scenario Outline: Verify name field
    Then I click on element with xpath "//input[@id='name']"
    Then element with xpath "//input[@id='firstName']" should be displayed
    And I type "<firstName>" into element with xpath "//input[@id='firstName']"
    Then element with xpath "//input[@id='middleName']" should be displayed
    And I type "<middleName>" into element with xpath "//input[@id='middleName']"
    Then element with xpath "//input[@id='lastName']" should be displayed
    And I type "<lastName>" into element with xpath "//input[@id='lastName']"
    Then I click on element with xpath "//span[contains(text(),'Save')]"
    Then element with xpath "//input[@id='name']" should be present
    Then element with xpath "//input[@id='name']" should have attribute "value " as "<fullName>"
    Examples:
      | firstName | middleName | lastName | fullName |
      | first | middle  | last | first middle last |
      | A | B |  C  | A B C |
      | 1 | 2 |  3  | 1 2 3 |
      | A |   |  C  | A  C |
      | A | B |     | A B  |
      | A | B |  C  | ABC  |

































