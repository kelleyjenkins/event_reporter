require 'minitest/autorun'
require 'minitest/pride'
require './lib/event_reporter'

class EventReporterTest < Minitest::Test


  def test_it_cleans_zipcodes
    zipcode = 456

    result = zipcode.to_s.rjust(5, "0")[0..4]

    assert_equal "00456", result
  end

  def test_it_formats_phone_numbers_into_10_digits
    homephone = 802-863-8374


    assert_equal "8028638374",
  end

end
