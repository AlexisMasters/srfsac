module Admin
  class DailyQuotesController < Admin::BaseController

    crudify :daily_quote,
            :order =>  'month, day',
            :title_attribute => 'theme', :xhr_paging => true

  end
end
