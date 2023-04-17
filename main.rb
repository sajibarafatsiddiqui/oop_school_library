#!/usr/bin/env ruby

require './app'

def options
  puts "Welcome to the School Library Console!\n"
  puts "\n"
  puts 'Here are the available options listed below:'
  puts '1) List of Book'
  puts '2) List all people'
  puts '3) Create a person'
  puts '4) Create a book'
  puts '5) Create a rental'
  puts '6) List all rentals for a given person id'
  puts '7) exit'
  print 'Press the number corresponding to the options provided: '
  option = gets.chomp.to_i

  until option.between?(1, 7)
    print 'Invalid Option! Please select a valid option of press 7 to exit :'
    option = gets.chomp.to_i
  end
  option
end

def dispatch_action(option, app)
  case option
  when 1 then app.list_books
  when 2 then app.list_persons
  when 3 then app.create_person
  when 4 then app.create_book
  when 5 then app.create_rental
  when 6 then app.list_rentals_by_person
  else puts 'Bye!'
  end
end

def input
  option = 0
  app = App.new
  while option != 7
    option = options
    next unless dispatch_action(option, app)
  end
end

def main
  input
end

main
