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
    result = report.find_first_name("Allison")

    assert_equal 16, result.count

    assert result.all? { |attendee| attendee.first_name == "Allison"}
  end

  def test_list_is_empty
    report = EventReporter.new

    assert report.queue.empty?
  end

  def test_list_has_an_attendee
    report = EventReporter.new

    report.add_attendee("John Smith")

    assert_equal "John Smith", report.queue[0]
  end

  def test_it_can_count_list
    report = EventReporter.new

    report.add_attendee("John Smith")
    report.add_attendee("Joe White")

    assert_equal 2, report.queue.count
  end

  def test_it_clears_out_list
    report = EventReporter.new

    report.add_attendee("John Smith")
    report.add_attendee("Joe White")

    assert_equal [], report.queue.clear
  end



end
