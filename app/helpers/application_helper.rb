# Methods added to this helper will be available to all templates in the application.

# You can extend refinery with your own functions here and they will likely not get overriden in an update.
module ApplicationHelper
  include Refinery::ApplicationHelper # leave this line in to include all of Refinery's core helper methods.

# -----------------------------------------------------------------------------  
# choose_body_floats -- dynamically choose float for body content sides of page
# this allows admin to change refinery setting (:gardenia_main_content_side)
# to make the sides switch selectable .. but that means we must dynamically 
# set the css float style for the sections
# -----------------------------------------------------------------------------  
  def choose_body_floats( section )
    main_is_left = (RefinerySetting.get(:gardenia_main_content_side) =~ /left/i)
    case section
      when :body_content_title,:body_content_left  then (main_is_left ? 'left' : 'right' )
      when :body_content_right then  (main_is_left ? 'right' : 'left' )
    else
      'right'
    end  # case
      
  end

# -----------------------------------------------------------------------------
# select_outer_div -- returns the outer div for properly selecting content sides of page
# -----------------------------------------------------------------------------  
  def select_outer_div( section )
    return "<div id = '#{section == :body_content_left ?  "main_content" : "sidebar_content" }' style = 'float: #{choose_body_floats( section )};'>"    
  end

# -----------------------------------------------------------------------------  
# prepare_content_page -- replaces *ALL* the erb/haml code on shared/content_page
# args: assumed to be local variables prior to invoking the view?
# expected (from controller?)
#   @page
# RESULTS & SIDE EFFECTS:
#   @sections -- array of section hashes (used by calling view)
#   @class_list -- list of css classes required
# -----------------------------------------------------------------------------  
  def prepare_content_page(show_empty_sections, remove_automatic_sections , hide_sections)
    
    @sections = [
      {:yield => :body_content_title, :fallback => page_title, :id => 'body_content_page_title', :title => true},
      {:yield => :body_content_right, :fallback => (@page.present? ? @page[Page.default_parts.second.to_sym] : nil)},
    ]
    
#    if @page.present? && Page.default_parts.size > 2  # need any sidebar boxes?
#      Page.default_parts[2,Page.default_parts.size - 2].each do |part|
#      @sections <<  {:yield => part.to_sym, :fallback => part.to_sym}
#    end
    
    @sections <<  {:yield => :body_content_left, :fallback => (@page.present? ? @page[Page.default_parts.first.to_sym] : nil)}
    
    @sections.reject{ |section| hide_sections.include?( section[:yield] ) }
  
    css = []
  
    @sections.each do |section|
      dom_id = ( section[:id] ||= section[:yield].to_s )
      section[:html] = ( content_for( section[:yield] ) )
      
      if section[:html].blank? and
          !show_empty_sections and
          !remove_automatic_sections and
          section.keys.include?(:fallback) and
          section[:fallback].present?
          
        section[:html] = section[:fallback].to_s.html_safe
        
      end  # if
      
      unless section[:html].blank?
      # see application_helper.rb for select_outer_div and choose_body_floats
    
        unless section[:title]
          section[:html] = "#{select_outer_div( section[:yield] )} <div class='clearfix' id='#{dom_id}'>#{section[:html]} </div> </div>"
        else
          section[:html] = "<div id = 'body_content_title' style = 'float: #{choose_body_floats( section[:yield] )};'> <h1 id='#{dom_id}'>#{section[:html]}</h1> </div>"
        end  # innermost unless .. else
        
      else
        css << "no_#{dom_id}"
      end  # outermost unless .. else
      
    end   # do each section
    
    @class_list = "clearfix#{" #{css.join(' ')}" if css.any?}"

  end



# -----------------------------------------------------------------------------  
# -----------------------------------------------------------------------------  
end # class helpers
