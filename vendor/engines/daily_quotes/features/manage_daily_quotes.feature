@daily_quotes
Feature: Daily Quotes
  In order to have daily_quotes on my website
  As an administrator
  I want to manage daily_quotes

  Background:
    Given I am a logged in refinery user
    And I have no daily_quotes

  @daily_quotes-list @list
  Scenario: Daily Quotes List
   Given I have daily_quotes titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of daily_quotes
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @daily_quotes-valid @valid
  Scenario: Create Valid Daily Quote
    When I go to the list of daily_quotes
    And I follow "Add New Daily Quote"
    And I fill in "Theme" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 daily_quote

  @daily_quotes-invalid @invalid
  Scenario: Create Invalid Daily Quote (without theme)
    When I go to the list of daily_quotes
    And I follow "Add New Daily Quote"
    And I press "Save"
    Then I should see "Theme can't be blank"
    And I should have 0 daily_quotes

  @daily_quotes-edit @edit
  Scenario: Edit Existing Daily Quote
    Given I have daily_quotes titled "A theme"
    When I go to the list of daily_quotes
    And I follow "Edit this daily_quote" within ".actions"
    Then I fill in "Theme" with "A different theme"
    And I press "Save"
    Then I should see "'A different theme' was successfully updated."
    And I should be on the list of daily_quotes
    And I should not see "A theme"

  @daily_quotes-duplicate @duplicate
  Scenario: Create Duplicate Daily Quote
    Given I only have daily_quotes titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of daily_quotes
    And I follow "Add New Daily Quote"
    And I fill in "Theme" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 daily_quotes

  @daily_quotes-delete @delete
  Scenario: Delete Daily Quote
    Given I only have daily_quotes titled UniqueTitleOne
    When I go to the list of daily_quotes
    And I follow "Remove this daily quote forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 daily_quotes
 