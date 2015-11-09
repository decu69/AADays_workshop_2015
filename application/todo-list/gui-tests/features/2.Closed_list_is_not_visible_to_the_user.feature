Feature: Closed lists are not visible to the user
  As a Krystian
  I want to display my TODO lists
  In order to see only my active lists

  @test_gui_2
  Scenario: Closing list
    Given I am logged in
    And I am on lists page
    And I add "Breakfast shopping list" list
    And I opened "Breakfast shopping list"
    And I add 10 "eggs" product
    When I buy "My new task" and mark this on my list
    And I go to lists page
    #Then I should see "Lists for krystian"
    Then I should not see "Breakfast shopping list"