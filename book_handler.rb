module BookHandler
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
end
