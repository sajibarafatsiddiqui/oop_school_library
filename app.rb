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

  def create_person
    puts '1) Create a Student 2) Create a Teacher'
    puts 'Please select the Person type:'
    type = gets.chomp.to_i
    until type.between?(1, 2)
      puts 'Please type 1 or 2 or press enter to exit:'
      type = gets.chomp.to_i
      return if type == ''
    end
    print 'Name: '
    name = gets.chomp.to_s
    while name == ''
      print 'Please enter a name or press enter to exit: '
      name = gets.chomp.to_s
      return if name == ''
    end

    type == 1 ? create_student(name) : create_teacher(name)
  end

  def create_student(name)
    print 'Age: '
    age = gets.chomp.to_i
    until age.integer?
      print 'Please enter a number or press enter to exit: '
      return if age == ''
    end
    print 'Classroom: '
    classroom = gets.chomp.to_s
    while classroom == ''
      print 'Please enter a classroom or press enter to exit: '
      classroom = gets.chomp.to_s
      return if classroom == ''
    end
    persons.push(Student.new(classroom, age, name))
    puts 'New Student has created successfully!'
  end

  def create_teacher(name)
    print 'Age: '
    age = gets.chomp.to_i
    until age.integer?
      print 'Please enter a number or press enter to exit: '
      return if age == ''
    end
    print 'Specification: '
    specification = gets.chomp.to_s
    while specification == ''
      print 'Please enter a specification or press enter to exit: '
      specification = gets.chomp.to_s
      return if specification == ''
    end
    persons.push(Teacher.new(specification, age, name))
    puts 'New Teacher has been created successfully!'
  end

  def create_book
    print 'Title: '
    title = gets.chomp.to_s
    while title == ''
      print 'Please enter a title or press enter to exit: '
      title = gets.chomp.to_s
      return if title == ''
    end
    print 'Auhtor: '
    author = gets.chomp.to_s
    while author == ''
      print 'Please enter an author or press enter to exit: '
      author = gets.chomp.to_s
      return if author == ''
    end
    books.push(Book.new(title, author))
    puts 'New book has been added successfully'
  end

  def create_rental
    print 'Date: '
    date = gets.chomp
    rgx = /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/
    until rgx.match?(dt)
      print 'Please enter a valid date or press enter to exit: '
      date = gets.chomp
      return if (date = '')
    end
    print 'Book: '
    book = gets.chomp
    until book.instance_of?(Book)
      print 'Please enter a valid book or press enter to exit: '
      book = gets.chomp
      return if (book = '')
    end
    print 'Book: '
    person = gets.chomp
    until person.instance_of?(Person)
      print 'Please enter a valid person or press enter to exit: '
      person = gets.chomp
      return if (person = '')
    end
    rentals.push(Rental.new(date, book, person))
    puts 'New rental has been added successfully'
  end

  def list_persons
    if persons.empty?
      puts 'No person created'
      return
    end
    puts "Amount of persons #{persons.length}"
    persons.each_with_index do |p, index|
      if p.instance_of?(::Student)
        puts "#{index+1} ID: #{p.id}, Name: #{p.name}, Age: #{p.age}, Classroom: #{p.classroom.label}}"
      else
        puts "#{index+1} ID: #{p.id}, Name: #{p.name}, Age: #{p.age}, Specialization: #{p.specialization}"
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
      puts "#{index+1} Title: \"#{b.title}\", Author: #{b.author}"
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
