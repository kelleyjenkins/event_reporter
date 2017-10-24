require "csv"
require 'pry'

puts "Welcome!"

# class EventReporter
#
#   def load_file
#     file = CSV.open "full_event_attendees.csv", headers: true, header_converters: :symbol
#     puts "#{file} loaded."
#   end


  def clean_phone(homephone)
    if homephone.nil?
      homephone = "0000000000"
    elsif homephone.length < 10
      homephone.to_s.rjust(10, "0")
    elsif homephone.length > 10
      homephone.gsub!(/[^0-9A-Za-z]/, '')
    else homephone
    end
  end


#
contents = CSV.open "full_event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = clean_first_name(row[:first_name])
  last = clean_last_name(row[:last_name])
  zipcode = clean_zipcode(row[:zipcode])
  email = row[:email_address]
  homephone = clean_phone(row[:homephone])
  street = row[:street]
  city = row[:city]
  state = row[:state]
  regdate = clean_registration(row[:regdate])

  puts " #{state} #{email} #{homephone} #{regdate}"
end
# end
