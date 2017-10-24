require "csv"
require 'pry'
require './lib/attendees'
puts "Welcome!"

class EventReporter
  attr_reader :attendees

  def initialize
    @attendees = []
  end

  def load_file(file = "full_event_attendees.csv")
    file = CSV.foreach file, headers: true, header_converters: :symbol do |row|
      @attendees << Attendee.new(row)
    end
  end

end



# contents = CSV.open "full_event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
#   name = clean_first_name(row[:first_name])
#   last = clean_last_name(row[:last_name])
#   zipcode = clean_zipcode(row[:zipcode])
#   email = row[:email_address]
#   homephone = clean_phone(row[:homephone])
#   street = row[:street]
#   city = row[:city]
#   state = row[:state]
#   regdate = clean_registration(row[:regdate])
#
#   puts " #{state} #{email} #{homephone} #{regdate}"
# end
# # end
