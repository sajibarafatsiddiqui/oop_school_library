require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @component.correct_name[0...10]
  end
end
