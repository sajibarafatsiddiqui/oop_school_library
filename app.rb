require './student'
require './teacher'
require './book'
require './rental'
require './person'

class App
  attr_accessor :persons, :books, :rentals

  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def list_persons
    if persons.empty?
      puts 'No person created'
      return
    end
    puts "Amount of persons #{persons.length}"
    persons.each_with_index do |p, index|
      if p.instance_of?(::Student)
        puts "#{index} ID: #{p.id}, Name: #{p.name}, Age: #{p.age}, Classroom: #{p.classroom.label}}"
      else
        puts "#{index} ID: #{p.id}, Name: #{p.name}, Age: #{p.age}, Specialization: #{p.specialization}"
      end
    end
  end

  def list_books
    if books.empty?
      puts 'No book created'
      return
    end
    puts "Amount of books #{books.length}"
    books.each_with_index do |b, index|
      puts "#{index} Title: \"#{b.title}\", Author: #{b.author}"
    end
  end

  def list_rentals_by_person
    print 'Please type person id: '
    id = gets.chomp.to_i
    rentals.each_with_index do |r, _index|
      cnt = 0
      if r.person.id == id
        cnt += 1
        puts "#{cnt} Date: #{r.date}, Book: #{r.book.title}, Rented By: #{r.person.name}"
      end
      puts 'No rental yet' if cnt.zero?
    end
  end
end
