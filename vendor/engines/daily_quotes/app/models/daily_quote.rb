class DailyQuote < ActiveRecord::Base

  acts_as_indexed :fields => [:theme, :author, :source]

  validates :theme,  :presence => true
  validates :author, :presence => true
  validates :source, :presence => true
  
  scope :todays_quote, lambda { where(['month = ? AND day = ?', Time.now.month, Time.now.day ]).limit(1) }
  scope :day_quote, lambda { |date| where(['month = ? AND day = ?', date.month, date.day ]).limit(1) }
  
  def to_s()
    sprintf( "%3s-%02d&emsp;%s",  Date::ABBR_MONTHNAMES[self.month], self.day, self.theme)  
  end
  
end
