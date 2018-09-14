# initialize all gardenia-expected settings
# format is: [variable, default]
 if RefinerySetting.table_exists?
  [
    [:gardenia_version,'0.1-0'],
    [:gardenia_hf_stretch,false],
    [:gardenia_nav_search,false],
    [:gardenia_side_search,false],
    [:gardenia_main_content_side,'left'],
    [:gardenia_parts_allow_widgets, %w(Widgets)],
    [:gardenia_disable_repeat_title, false],
    [:gardenia_parts_skip_empty, false],   # true if skip empty page.page_parts
    
    [:gardenia_banner_width,  987],
    [:gardenia_banner_height, 334],
    [:gardenia_banner_nominal,"990x336"],
    [:gardenia_banner_transition,  "fade"],
    [:gardenia_banner_delay,  7000],

  ].each{|setting,default| RefinerySetting.set(setting,default) if RefinerySetting.get(setting).nil?}
  
#   DEPRECATED WITH Gardenia 0.5.0
#   parts_list = RefinerySetting.get(:default_page_parts) || []
#   ['Body', 'Side Body', 'Recent Posts', 'Recent News'].each do |parts_name|
#     unless parts_list.include?(parts_name)
#       parts_list << parts_name
#     end
#     RefinerySetting.set(:default_page_parts, parts_list)
#   end  # do each special gardenia box

 end  # if ref table..
 
ENV['RECAPTCHA_PUBLIC_KEY']    = '6Lf_JnAUAAAAAK0Gc-FR4m0nKklAjx5mGq0CpcJd'
ENV['RECAPTCHA_PRIVATE_KEY']  = '6Lf_JnAUAAAAAPbR9k9MoIcY4mHKNgUgXZlxeYIR'
 
