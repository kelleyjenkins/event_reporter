require "csv"
require 'pry'


  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

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

contents = CSV.open "full_event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
  last = row[:last_name]
  zipcode = clean_zipcode(row[:zipcode])
  email = row[:email_address]
  homephone = clean_phone(row[:homephone])
  street = row[:street]
end
