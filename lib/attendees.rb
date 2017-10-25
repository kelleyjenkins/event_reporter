require './lib/cleaner'

class Attendee

  attr_reader :id,
              :reg_date,
              :first_name,
              :last_name,
              :email,
              :phone,
              :street,
              :city,
              :state,
              :zipcode

  def initialize(row)
    clean = Cleaner.new
    
    @id = row[:id]
    @reg_date = row[:regdate]
    @first_name = clean.clean_first_name(row[:first_name])
    @last_name = clean.clean_last_name(row[:last_name])
    @email = row[:email_address]
    @phone = clean.clean_phone(row[:homephone])
    @street = clean.clean_street(row[:street])
    @city = clean.clean_city(row[:city])
    @state = clean.clean_state(row[:state])
    @zipcode = clean.clean_zipcode(row[:zipcode])
  end
end
