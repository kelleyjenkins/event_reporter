class Queue
  attr_reader :list


  def initialize
    @list = []
  end

  def add_attendee(attendee)
    @list << attendee
  end

  def count
    @list.count
  end

  def clear
    @list.clear
  end
end
