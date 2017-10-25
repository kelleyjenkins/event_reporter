require 'minitest/autorun'
require 'minitest/pride'
require './lib/event_reporter'

class EventReporterTest < Minitest::Test

  def test_it_loads_file
    report = EventReporter.new

    assert report.attendees.empty?

    report.load_file

    refute report.attendees.empty?
  end

  def test_it_adds_first_name_to_queue
    report = EventReporter.new

    report.load_file
    report.find(first_name, "John")

    assert_equal "John", queue[0]
  end



end
