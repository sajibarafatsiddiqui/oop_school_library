module PersonHandler
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
end
