Feature: User can log in to the account
  As a Krystian
  I want to log in to the application
  In order to see my TODO lists

  @test_gui_1
  Scenario: Log in to the application
    Given I am on log in page
    When I enter correct login and password
    Then I should see "Lists for krystian"