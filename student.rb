# frozen_string_literal: true

require './person'
# added the class Student
class Student < Person
  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
