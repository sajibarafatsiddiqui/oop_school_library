require './person'
require './classroom'
# added the class Student
class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    classroom = Classroom.new(classroom)
    @classroom = classroom
    classroom.students << self
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
