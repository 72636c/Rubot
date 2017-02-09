# represents a table top that a robot moves across

class Table

  def initialize(width = 5, height = 5)
    @width = width
    @height = height
  end

  def is_valid(position)
    position.x < @width && position.y < @height && position.x >= 0 && position.y >= 0
  end

end
