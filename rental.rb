class Rental
  attr_accesor :date, :person, :book
  def initialize(person, book, date)
    @date = date
    person.rentals << self
    book.rentals << self
  end
end
