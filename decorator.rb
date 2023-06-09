require './nameable'

class Decorator < Nameable
  attr_accessor :component

  def initialize(component)
    super()
    @component = component
  end

  # The Decorator delegates all work to the wrapped component.
  def correct_name
    @component.correct_name
  end
end
