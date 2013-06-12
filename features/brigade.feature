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
    # this is ugly :(  (brigade[tag_list])
    And I fill in "brigade[tag_list]" with "roof"
    And I choose the country - "poland"
    And I press "Create Brigade"
    Then I should see "Brigade was successfully created."
    And I should see "Test_brigade"
    And I should have 1 brigade

  # DRY this!
  Scenario: Create Invalid Brigade
    Given I have no brigades
    And I have countries titled "Russia", "Poland"
    And I am on the list of brigades
    When I follow "New Brigade"
    And I fill in "Name" with ""
    And I fill in "Workers" with "1"
    And I fill in "Cost" with "10"
    # this is ugly :(  (brigade[tag_list])
    And I fill in "brigade[tag_list]" with "roof"
    And I choose the country - "poland"
    And I press "Create Brigade"
    Then I should see "2 errors prohibited this brigade from being saved:"
    And I should see "Name can't be blank"
    And I should see "Name is too short (minimum is 4 characters)"

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
    And I should see "Country_"
    And I should see "Edit | Back"

  Scenario: Update Brigade
    Given I have brigades titled "Test_brigade"
    And I have countries titled "Russia", "Poland"
    And I am on the list of brigades
    When I follow "Edit"
    And I fill in "Name" with "Test_brigade_upd"
    And I choose the country - "poland"
    And I press "Update Brigade"
    Then I should see "Brigade was successfully updated."
    And I should see "Test_brigade_upd"
    And I should see "poland"

  Scenario: Destroy Brigade
    Given I have brigades titled "Test_brigade"
    And I am on the list of brigades
    When I follow "Destroy"
    Then I should have 0 brigade

  Scenario: Working With Tags
    Given I have brigade titled "Test_1" with tags "roof, sanitary"
    And I have brigade titled "Test_2" with tags "laminate, sanitary"
    And I have brigade titled "Test_3" with tags "laminate"
    And I am on the list of brigades
        When I press first link "laminate"
        Then I should see "Test_2"
        And I should see "Test_3"
        And I should not see "Test_1"

        When I press "Reset all filters"
        Then I should see "Test_1"
        And I should see "Test_2"
        And I should see "Test_3"

        When I press first link "roof"
        Then I should see "Test_1"
        And I should not see "Test_2"
        And I should not see "Test_3"

  Scenario: Tags Smart Link
    Given I have brigade titled "Test_1" with tags "roof, sanitary"
    And I have brigade titled "Test_2" with tags "laminate, sanitary"
    And I am on the list of brigades
    And I should see "roof x 1"
    And I should see "sanitary x 2"
    And I should see "laminate x 1"
    When I press first link "Destroy"
    Then I should see "sanitary x 1"
    And I should see "laminate x 1"
    And I should not see "roof"
