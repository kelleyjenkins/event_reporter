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
    end

    if split[0] == "find" && split[1] == "first_name"
      e.find_first_name(split[2])
    end

    if split[0] == "find" && split[1] == "last_name"
      e.find_last_name(split[2])
    end

    if split[0] == "find" && split[1] == "email"
      e.find_email(split[2])
    end

    if split[0] == "find" && split[1] == "phone"
      e.find_phone(split[2])
    end

    if split[0] == "find" && split[1] == "street"
      e.find_street(split[2])
    end

    if split[0] == "find" && split[1] == "city"
      e.find_city(split[2])
    end

    if split[0] == "find" && split[1] == "state"
      e.find_state(split[2])
    end

    if split[0] == "find" && split[1] == "zipcode"
      e.find_zip(split[2])
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
             find <attribute> <name>
             queue count
             queue clear
             queue print
             queue print by <attribute>
             queue save to <filename.csv>
             queue export htmp <filename.csv>
             help
             help <command>\n"
    end

    if input == "help queue count"
      puts "The queue count fuction will tell you how many entries are in your queue."
    end

    if input == "help queue print"
      puts "The queue print fuction will print the entries in your queue."
    end

    if input == "queue print"
      e.print_attendees
    end

    if input.downcase == "exit"
      break
    end

  end
