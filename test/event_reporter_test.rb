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

  def test_queue_is_empty
    report = EventReporter.new

    assert report.queue.empty?
  end

  def test_queue_has_an_attendee
    report = EventReporter.new

    report.load_file
    report.add_attendee("John Smith")

    assert_equal "John Smith", report.queue[0]
  end

  def test_it_can_count_queue
    report = EventReporter.new

    report.add_attendee("John Smith")
    report.add_attendee("Joe White")

    assert_equal 2, report.queue.count
  end

  def test_it_can_count_queue_added_from_csv
    report = EventReporter.new

    report.load_file
    report.find_last_name("Smith")

    assert_equal 35, report.count
  end

  def test_it_clears_out_list
    report = EventReporter.new

    report.load_file
    report.find_last_name("Smith")

    assert_equal [], report.clear
  end

  def test_it_adds_last_name_to_queue
    report = EventReporter.new

    report.load_file
    report.find_last_name("Smith")

    assert_equal 35, report.count
  end

  def test_it_adds_by_email_to_queue
    report = EventReporter.new

    report.load_file
    result = report.find_email("odfarg06@jumpstartlab.com")

    assert result.all? { |attendee| attendee.email == "odfarg06@jumpstartlab.com"}
  end

  def test_it_finds_by_phone
    report = EventReporter.new

    report.load_file
    report.find_phone("7872950000")

    assert_equal 1, report.count
  end

  def test_it_adds_by_city
    report = EventReporter.new

    report.load_file
    report.find_city("Ann Arbor")

    assert_equal 14, report.count
  end

  def test_it_adds_by_state
    report = EventReporter.new

    report.load_file
    report.find_state("VT")

    assert_equal 324, report.count
  end

  def test_it_adds_by_zipcode
    report = EventReporter.new

    report.load_file
    report.find_zip("45056")

    assert_equal 14, report.count
  end
end
