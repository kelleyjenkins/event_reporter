require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee'

class AttendeeTest < Minitest::Test

  def test_it_holds_attributes
    hash = {name: "Allison", city: "Washington"}

    attemdee = Attendee.new(hash)

    

  end


end
