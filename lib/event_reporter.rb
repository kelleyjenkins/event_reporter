require "csv"
require 'pry'
require './lib/attendees'
require './lib/queue'

puts "Welcome!"

class EventReporter
  attr_reader :attendees,
              :queue

  def initialize
    @attendees = []
    @queue = []
    @attribute = :reg_date

  end

  def load_file(file = "full_event_attendees.csv")
    file = CSV.foreach file, headers: true, header_converters: :symbol do |row|
      @attendees << Attendee.new(row)
    end
  end

   def add_attendee(attendee)
     @queue << attendee
   end

   def count
     @queue.count
   end

   def clear
     @queue = []
   end

   def find_first_name(criteria)
     @queue = @attendees.select do |attendee|
       attendee.first_name == criteria
     end
   end

      def find_last_name(criteria)
      @queue = @attendees.select do |attendee|
        attendee.last_name == criteria
      end
    end
 end



  #
  #  def find_last_name(criteria)
  #    last_names = @attendees.select do |attendee|
  #      criteria == attendee.last_name
  #    end
  #    @queue << last_names
  #  end
  #
  # def find_email(criteria)
  #   emails = @attendees.select do |attendee|
  #      criteria == attendee.email
  #   end
  #   @queue << emails
  # end
  #
  #  def find_phone(criteria)
  #   phones = @attendees.select do |attendee|
  #     criteria == attendee.phone
  #   end
  #   @queue << phones
  # end
  #
  # def find_street(criteria)
  #   streets = @attendees.select do |attendee|
  #     criteria == attendee.street
  #   end
  #   @queue << streets
  # end
  #
  # def find_city(criteria)
  #   cities = @attendees.select do |attendee|
  #     criteria == attendee.city
  #   end
  #   @queue << cities
  # end
  #
  # def find_state(criteria)
  #   states = @attendees.select do |attendee|
  #     attendee.state == criteria
  #   end
  #   @queue << states
  # end
  #
  # def find(zipcode)
  #   zips = @attendees.select do |attendee|
  #     attendee.zipcode == criteria
  #   end
  #   @queue << zips
  # end



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
