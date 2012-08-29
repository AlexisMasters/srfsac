class CreateEventCalendars < ActiveRecord::Migration

  def self.up
    load(Rails.root.join('db', 'seeds', 'event_calendars.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "event_calendars"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/event_calendars"})
    end

  end

end
