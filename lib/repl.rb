require 'csv'
require './lib/attendees'
require './lib/queue'
require './lib/event_reporter'
require 'pry'


e = EventReporter.new

loop do
    print "Enter a command!\n"
    input = gets.chomp
    split = input.split(' ')

    if split[0] == "load"
        e.load_file
    # puts "file loaded"
    end

    if split[0] == "find" && split[1] == "first_name"
        e.find_first_name(split[2])
    end

    if split[0] == "find" && split[1] == "last_name"
        e.find_last_name(split[2])
    end

    if input == "queue clear"
      e.clear
    end

    if input == "queue count"
      puts e.count
    end

    if input == "help"
      print "The commands you can use are:
             load <file>
             queue count
             queue clear
             find <attribute> <name>\n"
    end

    if input == "queue count"

      #
      # elsif input == "queue count"
      #   e.count
      # elsif input == "queue clear"
      #   input.clear
      # elseif input == "exit"
      # break
    end
# end
# loop do
#     print "Enter a command."
#     input = gets.chomp.split(' ')
#     @request = input[0]
#     parameter = input[1]
#     argument = input[2]
#     if @request == "load"
#       load_file(input[1])
#     end
#     break
    # elsif input.split(' ').first == "find" && input.include?("first_name")
    #   find_first_name
    # elsif input == "queue count"
    #   input.queue.count
    # elsif input == "queue clear"
    #   input.clear
    # elseif input == "exit"
    # break
  # end
