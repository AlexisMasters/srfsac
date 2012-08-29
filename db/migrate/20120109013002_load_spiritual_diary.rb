class LoadSpiritualDiary < ActiveRecord::Migration
  def self.up
     down
     load_diary( true )
  end

  def self.down
    DailyQuote.delete_all
  end
  
protected

SPIRITUAL_DIARY = "#{Rails.root}/SpiritualDiary4.txt"  unless Object.const_defined? "SPIRITUAL_DIARY"

def self.load_diary( trace=false )
  puts "****** load spiritual diary *************"  if trace
  
  File.open( SPIRITUAL_DIARY ) do |file|
    file.each_line("\n") do |entry|
      fields = entry.chomp.split(/\|/)
      diary = DailyQuote.create(
        :month  => fields[0],
        :day    => fields[1],
        :theme  => fields[2],
        :quote  => fields[3],
        :author => fields[4],
        :source => fields[5]
      )
      
      printf( "%2d-%2d\t%20.20s\t%20.20s\t%20.20s\t%40.40s\n", 
        diary.month,
        diary.day,
        diary.theme,
        diary.author,
        diary.source,
        diary.quote,
      ) if trace
      
    end  # each line
  end  # file open
  
  puts "****** end  spiritual diary *************"   if trace
end



end  # migration
