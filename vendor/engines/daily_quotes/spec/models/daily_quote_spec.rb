require 'spec_helper'

describe DailyQuote do

  def reset_daily_quote(options = {})
    @valid_attributes = {
      :id => 1,
      :theme => "RSpec is great for testing too"
    }

    @daily_quote.destroy! if @daily_quote
    @daily_quote = DailyQuote.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_daily_quote
  end

  context "validations" do
    
    it "rejects empty theme" do
      DailyQuote.new(@valid_attributes.merge(:theme => "")).should_not be_valid
    end

    it "rejects non unique theme" do
      # as one gets created before each spec by reset_daily_quote
      DailyQuote.new(@valid_attributes).should_not be_valid
    end
    
  end

end