Feature: Shopping list is closed when all product are bought
  As a Krystian
  I want to buy all my products from my list
  In order to finish shopping and get all necessary products

  @test_gui_3
  Scenario: Buying all products on the list
    Given I am logged in
    And I am on lists page
    And I add "ASAP shopping" list
    And I opened "ASAP shopping"
    And I add 4 "beers" product
    And I add 10 "eggs" product
    When I buy "beers" and mark this on my list
    And I buy "eggs" and mark this on my list
    And I go to lists page
    Then I should see "Lists for krystian"
    And I should not see "ASAP shopping"