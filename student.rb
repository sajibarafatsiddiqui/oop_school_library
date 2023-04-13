require './person'
# added the class Student
class Student < Person
  attr_accesor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    classroom.student << self
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
