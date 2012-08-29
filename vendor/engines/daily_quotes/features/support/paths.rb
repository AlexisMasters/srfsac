module NavigationHelpers
  module Refinery
    module DailyQuotes
      def path_to(page_name)
        case page_name
        when /the list of daily_quotes/
          admin_daily_quotes_path

         when /the new daily_quote form/
          new_admin_daily_quote_path
        else
          nil
        end
      end
    end
  end
end
