require 'spec_helper'

describe EventCalendar do

  def reset_event_calendar(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @event_calendar.destroy! if @event_calendar
    @event_calendar = EventCalendar.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_event_calendar
  end

  context "validations" do
    
    it "rejects empty name" do
      EventCalendar.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_event_calendar
      EventCalendar.new(@valid_attributes).should_not be_valid
    end
    
  end

end