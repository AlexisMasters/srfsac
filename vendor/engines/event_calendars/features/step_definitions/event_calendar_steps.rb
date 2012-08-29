Given /^I have no event_calendars$/ do
  EventCalendar.delete_all
end

Given /^I (only )?have event_calendars titled "?([^\"]*)"?$/ do |only, titles|
  EventCalendar.delete_all if only
  titles.split(', ').each do |title|
    EventCalendar.create(:name => title)
  end
end

Then /^I should have ([0-9]+) event_calendars?$/ do |count|
  EventCalendar.count.should == count.to_i
end
