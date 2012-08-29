@event_calendars
Feature: Event Calendars
  In order to have event_calendars on my website
  As an administrator
  I want to manage event_calendars

  Background:
    Given I am a logged in refinery user
    And I have no event_calendars

  @event_calendars-list @list
  Scenario: Event Calendars List
   Given I have event_calendars titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of event_calendars
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @event_calendars-valid @valid
  Scenario: Create Valid Event Calendar
    When I go to the list of event_calendars
    And I follow "Add New Event Calendar"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 event_calendar

  @event_calendars-invalid @invalid
  Scenario: Create Invalid Event Calendar (without name)
    When I go to the list of event_calendars
    And I follow "Add New Event Calendar"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 event_calendars

  @event_calendars-edit @edit
  Scenario: Edit Existing Event Calendar
    Given I have event_calendars titled "A name"
    When I go to the list of event_calendars
    And I follow "Edit this event_calendar" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of event_calendars
    And I should not see "A name"

  @event_calendars-duplicate @duplicate
  Scenario: Create Duplicate Event Calendar
    Given I only have event_calendars titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of event_calendars
    And I follow "Add New Event Calendar"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 event_calendars

  @event_calendars-delete @delete
  Scenario: Delete Event Calendar
    Given I only have event_calendars titled UniqueTitleOne
    When I go to the list of event_calendars
    And I follow "Remove this event calendar forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 event_calendars
 