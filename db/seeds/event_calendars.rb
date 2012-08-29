if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'event_calendars').blank?
      user.plugins.create(:name => 'event_calendars',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Calendar',
    :link_url => '/event_calendars',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/event_calendars(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end
