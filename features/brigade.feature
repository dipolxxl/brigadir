Feature: Manage brigades
  In order to manage brigades
  As a user
  I want to manage brigades

  Scenario: Brigades List
    Given I have brigades titled "First", "Second"
    When I go to the list of brigades
    Then I should see "First"
    And I should see "Second"
    And I should see "New Brigade"

  Scenario: Create Valid Brigade
    Given I have no brigades
    And I have countries titled "Russia", "Poland"
    And I am on the list of brigades
    When I follow "New Brigade"
    And I fill in "Name" with "Test_brigade"
    And I fill in "Workers" with "5"
    And I fill in "Cost" with "350"
    # this is ugly ;(  (brigade[tag_list])
    And I fill in "brigade[tag_list]" with "roof"
    And I choose the country - "Poland"
    And I press "Create Brigade"
    Then I should see "Brigade was successfully created."
    And I should see "Test_brigade"
    And I should have 1 brigade

  Scenario: Show Brigade
    Given I have brigades titled "Test_brigade"
    And I am on the list of brigades
    When I follow "Show"
    # name of the brigade
    Then I should see "Test_brigade"
    # workers (default)
    And I should see "5"
    # cost (default)
    And I should see "100"
    # country (default)
    And I should see "Country"
    And I should see "Edit | Back"
