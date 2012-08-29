class EventCalendar < ActiveRecord::Base

   require 'rest-client'

   def self.get_remote_events( url )

      response = RestClient.get url

      case response.code
         when 200      then response
         when 300..399 then "url incorrect; redirected"
         when 400..499 then "error #{ response.code.to_s }"
      else
         "unknown error code: #{ response.code.to_s }"
      end   # case

   end
end
