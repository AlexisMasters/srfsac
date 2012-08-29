if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'daily_quotes').blank?
      user.plugins.create(:name => 'daily_quotes',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Daily Quotes',
    :link_url => '/daily_quotes',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/daily_quotes(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end