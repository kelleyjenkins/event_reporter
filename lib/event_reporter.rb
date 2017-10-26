require "csv"
require 'pry'
require './lib/attendee'
require './lib/queue'

puts "Welcome!"

class EventReporter
  attr_reader :attendees,
              :queue

  def initialize
    @attendees = []
    @queue = []
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

  def find_email(criteria)
    @queue = @attendees.select do |attendee|
      attendee.email == criteria
    end
  end

  def find_phone(criteria)
    @queue = @attendees.select do |attendee|
      attendee.phone == criteria
    end
  end

  def find_street(criteria)
    @queue = @attendees.select do |attendee|
       attendee.street == criteria
    end
  end

  def find_city(criteria)
    @queue = @attendees.select do |attendee|
      attendee.city == criteria
    end
  end

  def find_state(criteria)
    @queue = @attendees.select do |attendee|
      attendee.state == criteria
    end
  end

  def find_zip(criteria)
    @queue = @attendees.select do |attendee|
      attendee.zipcode == criteria
    end
  end


  def print_attendees
    print "LAST NAME  FIRST NAME              EMAIL                ZIPCODE        CITY      STATE   ADDRESS   PHONE\n"
      @queue.each do |attendee|
        print "#{attendee.last_name}    #{attendee.first_name}     #{attendee.email}     #{attendee.zipcode}     #{attendee.city}     #{attendee.state}     #{attendee.street}     #{attendee.phone}\n"
      end
  end
end
