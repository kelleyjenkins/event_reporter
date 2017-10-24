require 'minitest/autorun'
require 'minitest/pride'
require './lib/queue'

class QueueTest < Minitest::Test

  def test_list_is_empty
    queue = Queue.new

    assert queue.list.empty?
  end

  def test_list_has_an_attendee
    queue = Queue.new

    queue.add_attendee("John Smith")

    assert_equal "John Smith", queue.list[0]
  end

  def test_it_can_count_list
    queue = Queue.new

    queue.add_attendee("John Smith")
    queue.add_attendee("Joe White")

    assert_equal 2, queue.list.count
  end

  def test_it_clears_out_list
    queue = Queue.new

    queue.add_attendee("John Smith")
    queue.add_attendee("Joe White")

    assert_equal [], queue.list.clear
  end

  def test_it_prints_data
    queue = Queue.new

    

end
