require 'minitest/autorun'
require 'minitest/pride'
require './lib/event_reporter'

class EventReporterTest < Minitest::Test

  def test_it_loads_file
    report = EventReporter.new
  end

  

end
