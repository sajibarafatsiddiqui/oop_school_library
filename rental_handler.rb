module RentalHandler
  def create_rental
    print 'Date (yyyy-mm-dd): '
    date = gets.chomp
    rgx = /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/
    until rgx.match?(date)
      print 'Please enter a valid date or press enter to exit: '
      date = gets.chomp
      return if (date = '')
    end
    print 'Book(number): '
    book = gets.chomp
    book = books[book.to_i]
    print 'Person(number): '
    person = gets.chomp
    person = persons[person.to_i]
    rentals.push(Rental.new(date, book, person))
    puts 'New rental has been added successfully'
  end
end
