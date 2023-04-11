# added the class Person
class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  # Added exceptions to fullfill the requirement.
  def is_of_age? # rubocop:disable Naming/PredicateName
    return true if @age >= 18


    false
  end

  def can_use_services?
    return true if is_of_age? || @parent_permission


    false
  end
end