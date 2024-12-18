Feature: Saucedemo filter

  Background:
    Given the home page is opened
    And the 'Username' field is filled with 'standard_user'
    And the 'Password' field is filled with 'secret_sauce'
    And the 'Login' button is clicked

  Scenario: Filter items by name (A to Z)
    Given the 'Filter' dropdown is displayed
    When the 'Filter' dropdown is selected
    And the A to Z option is chosen
    Then the items should be displayed in alphabetical order

  Scenario: Filter items by name (Z to A)
    Given the 'Filter' dropdown is displayed
    When the 'Filter' dropdown is selected
    And the Z to A option is chosen
    Then the items should be displayed in reverse alphabetical order

  Scenario: Filter items by price (From Low to High)
    Given the 'Filter' dropdown is displayed
    When the 'Filter' dropdown is selected
    And the low to high option is chosen
    Then the items should be displayed in ascending order of price

  Scenario: Filter items by price (From High to Low)
    Given the 'Filter' dropdown is displayed
    When the 'Filter' dropdown is selected
    And the high to low option is chosen
    Then the items should be displayed in descending order of price



