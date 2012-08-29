Given /^I have no daily_quotes$/ do
  DailyQuote.delete_all
end

Given /^I (only )?have daily_quotes titled "?([^\"]*)"?$/ do |only, titles|
  DailyQuote.delete_all if only
  titles.split(', ').each do |title|
    DailyQuote.create(:theme => title)
  end
end

Then /^I should have ([0-9]+) daily_quotes?$/ do |count|
  DailyQuote.count.should == count.to_i
end
