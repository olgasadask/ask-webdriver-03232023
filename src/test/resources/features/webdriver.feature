#exercise for Selenium WebDriver methods
  @webdriver
  Feature: exercise with Selenium WebDriver methods

    @webdriver1
    Scenario: Exercise with Google
     # Given I open url "https://www.google.com/"
     # Then I should see page title as "Google"
       Given AV navigate to "ask-int"
      Then AV get page information
      And AV maximize the window


