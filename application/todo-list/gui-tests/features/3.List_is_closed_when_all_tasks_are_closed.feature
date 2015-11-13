Feature: Shopping list is closed when all product are bought
  As a Matylda
  I want to buy only one product from my list
  In order to finish shopping and get all necessary products

  @test_gui_3
  Scenario: Buy only one product from the list - 
    Given I am logged in
    And I am on lists page
    And I add "ASAP shopping" list
    And I opened "ASAP shopping"
    And I add 4 "beers" product
    And I add 10 "eggs" product
    When I buy "beers" and mark this on my list
    And I can`t buy eggs as they`ve already sold, so I can just drink beer for the morning breakfast
    And I go to lists page
    Then I should see "Lists for matylda"
    And I should see "ASAP shopping"
    When I opened "ASAP shopping"
    Then I should see 10 "eggs" product to buy