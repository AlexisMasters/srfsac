module NavigationHelpers
  module Refinery
    module EventCalendars
      def path_to(page_name)
        case page_name
        when /the list of event_calendars/
          admin_event_calendars_path

         when /the new event_calendar form/
          new_admin_event_calendar_path
        else
          nil
        end
      end
    end
  end
end
