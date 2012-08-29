class EventCalendarsController < ApplicationController

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event_calendar in the line below:
    @use_event_calendars = true
    present(@page)
  end

  def get_events
    @events_data = EventCalendar.get_remote_events( 
          RefinerySetting.find_or_set( 
                :event_calendar_url, "event_calendar_url_required"
          ) 
    ) 
    puts "********** events data ***************"
    render :layout => false
  end

protected

end
