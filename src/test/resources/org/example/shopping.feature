Feature: Saucedemo Shopping

  Background:
    Given the home page is opened
    And the 'Username' field is filled with 'standard_user'
    And the 'Password' field is filled with 'secret_sauce'
    And the 'Login' button is clicked

  Scenario: Buying a onesie and bike light
    Given the 'Sauce Labs Onesie' is added to the cart
    And the 'Sauce Labs Bike Light' is added to the cart
    And the 'Cart' button is clicked
    And the 'Checkout' button is clicked
    And the 'First Name' field is filled with 'First_name'
    And the 'Last Name' field is filled with 'Last_name'
    And the 'Zip Code' field is filled with '1234'
    When the 'Continue' button is clicked
    Then the price should read 'Total: $19.42'
    Then the cart is emptied

  Scenario Outline: Buying an item
    Given the '<item>' is added to the cart
    And the 'Cart' button is clicked
    And the 'Checkout' button is clicked
    And the 'First Name' field is filled with '<firstName>'
    And the 'Last Name' field is filled with '<lastName>'
    And the 'Zip Code' field is filled with '<zipCode>'
    When the 'Continue' button is clicked
    Then the price should read 'Total: $<totalPrice>'
    Then the cart is emptied
    Examples:
      | item                              | firstName       | lastName       | zipCode | totalPrice |
      | Sauce Labs Onesie               | trent  | aawa  | 1313    | 8.63      |
      | Sauce Labs Bike Light             | marks_well        |well_marks        | 2444    | 10.79    |
      | Sauce Labs Fleece Jacket          | that_guy      | odo      | 3441 | 53.99  |
      | Sauce Labs Backpack                | carl    | jones   | 4112    | 32.39    |
      | Test.allTheThings() T-Shirt (Red) | claudie      | jones  | 5441   | 17.27    |


  Scenario Outline: Buying two items
    Given the '<item1>' is added to the cart
    And the '<item2>' is added to the cart
    And the 'Cart' button is clicked
    And the 'Checkout' button is clicked
    And the 'First Name' field is filled with '<firstName>'
    And the 'Last Name' field is filled with '<lastName>'
    And the 'Zip Code' field is filled with '<zipCode>'
    When the 'Continue' button is clicked
    Then the price should read 'Total: $<totalPrice>'
    Then the cart is emptied
    Examples:
      | item1                   | item2                                   | firstName       | lastName       | zipCode | totalPrice |
      | Sauce Labs Onesie     | Sauce Labs Bike Light                 | bed  | sheet  | 1234   | 19.42     |
      | Sauce Labs Onesie     | Test.allTheThings() T-Shirt (Red)       | mary      | jane       | 4025    | 25.90      |
      | Sauce Labs Bike Light | Sauce Labs Fleece Jacket                | harry       | potter       | 3332   | 64.78     |
      | Sauce Labs Onesie     | Sauce Labs Backpack                      | jon     | smith    | 4025   | 41.02      |
      | Sauce Labs Bike Light | Test.allTheThings() T-Shirt (Red)       | bob_jones       | jones_bob      | 2112  | 28.06     |
      | Sauce Labs Fleece Jacket| Sauce Labs Onesie                       | mike_brown      | brown_mike     | 6621    | 62.62      |

  Scenario: Remove an item from the cart
    Given the 'Sauce Labs Onesie' is added to the cart
    And the 'Cart' button is clicked
    And remove 'Sauce Labs Onesie' from the cart
    Then the cart should be empty

  Scenario: Remove every items from the cart
    Given the 'Sauce Labs Onesie' is added to the cart
    And the 'Sauce Labs Bolt T-Shirt' is added to the cart
    And the 'Cart' button is clicked
    And remove 'Sauce Labs Onesie' from the cart
    And remove "Sauce Labs Bolt T-Shirt" from the cart
    Then the cart should be empty

  Scenario Outline: Price change after removing an item
    Given the "<item1>" is added to the cart
    And the "<item2>" is added to the cart
    And the "Cart" button is clicked
    And remove "<item1>" from the cart
    And the 'Checkout' button is clicked
    And the 'First Name' field is filled with '<firstName>'
    And the 'Last Name' field is filled with '<lastName>'
    And the 'Zip Code' field is filled with '<zipCode>'
    When the 'Continue' button is clicked
    Then the price should read "Total: $<totalPrice>"
    Then the cart is emptied
    Examples:
      | item1                   | item2                                   | firstName       | lastName       | zipCode | totalPrice |
      | Sauce Labs Onesie     | Sauce Labs Bolt T-Shirt                | mary  | jane  | 7711   | 17.27    |
      | Sauce Labs Onesie     | Sauce Labs Bike Light                   | mike       | mill       | 5133    | 10.79      |
      | Sauce Labs Bike Light | Sauce Labs Fleece Jacket                | kitara      | jones       | 9919    | 53.99      |
      | Sauce Labs Onesie     | Test.allTheThings() T-Shirt (Red)       | avatar     | aang   | 5442    | 17.27       |
      | Sauce Labs Bike Light | Sauce Labs Backpack      | watler      | jones      | 4421    | 32.39     |
      | Sauce Labs Fleece Jacket| Sauce Labs Onesie                       | john      | casper     | 3216    | 8.63       |