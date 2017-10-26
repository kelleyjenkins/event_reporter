require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee'

class AttendeeTest < Minitest::Test

  def test_it_holds_attributes
    hash = {first_name: "Allison", city: "Washington"}
    attendee = Attendee.new(hash)


    assert equal "Allison", attendee.first_name
  end
end
