require "csv"
require 'pry'
require './lib/attendees'
require './lib/queue'

puts "Welcome!"

class EventReporter
  attr_reader :attendees
              :queue

  def initialize
    @attendees = []
    @queue = Queue.new
  end

  def load_file(file = "full_event_attendees.csv")
    file = CSV.foreach file, headers: true, header_converters: :symbol do |row|
      @attendees << Attendee.new(row)
    end
  end

  def find(first_name, criteria)
    first_names = @attendees.select do |attendee|
       criteria == attendee.first_name
     end
     @queue << first_names
   end

   def find(last_name, criteria)
     last_names = @attendees.select do |attendee|
       criteria == attendee.last_name
     end
     @queue << last_names
   end

  def find(email)
    emails = @attendees.select do |attendee|
       criteria == attendee.email
    end
    @queue << emails
  end

   def find(phone)
    phones = @attendees.select do |attendee|
      criteria == attendee.phone
    end
    @queue << phones
  end

  def find(street)
    streets = @attendees.select do |attendee|
      criteria == attendee.street
    end
    @queue << streets
  end

  def find(city)
    cities = @attendees.select do |attendee|
      criteria == attendee.city
    end
    @queue << cities
  end

  def find(state)
    states = @attendees.select do |attendee|
      criteria == attendee.state
    end
    @queue << states
  end

  def find(zipcode)
    zips = @attendees.select do |attendee|
      criteria == attendee.zipcode
    end
    @queue << zips
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
