Feature: Closed lists are not visible to the user
  As a Krystian
  I want to display my TODO lists
  In order to see only my active lists

  @test_gui_2
  Scenario: Closing list BDD
    Given I am logged in
    And I am on lists page
    And I add "My new list" list
    And I opened "My new list"
    And I add "My new task" task
    When I mark "My new task" task as done
    And I wait until pending requests will finish
    And I go to lists page
    Then I should see "Lists for krystian"
    And I should not see "My new list"