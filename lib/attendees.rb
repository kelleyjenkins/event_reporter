class Attendee

  attr_reader :number,
              :reg_date,
              :first_name,
              :last_name,
              :email,
              :phone,
              :street,
              :city,
              :state,
              :zipcode

  def initialize(report)
    @number = report[:' ']
    @reg_date = report[:regdate]
    @first_name = report[:first_name]
    @last_name = report[:last_name]
    @email = report[:email_address]
    @phone = report[:homephone]
    @street = report[:street]
    @city = report[:city]
    @state = report[:state]
    @zipcode = report[:zipcode]
  end
end
