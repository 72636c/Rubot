# represents a toy robot

class Robot

  def self.place(table, x, y, orientation, robot)
    case orientation
    when :north
      position = North.new(x, y)
    when :east
      position = East.new(x, y)
    when :south
      position = South.new(x, y)
    when :west
      position = West.new(x, y)
    else
      raise "invalid orientation"
    end
    
    table.is_valid(position) ? PlacedRobot.new(table, position) : robot
  end

  def initialize(table)
    @table = table
  end
  
  def place(x, y, orientation)
    Robot.place(@table, x, y, orientation, self)
  end

  def move
    self
  end

  def left
    self
  end
  
  def right
    self
  end

  def report
    "UNPLACED"
  end

end

# [internal] represents a toy robot that has been placed on a tabletop

class PlacedRobot

  def initialize(table, position)
    @table = table
    @position = position
  end
  
  def place(x, y, orientation)
    Robot.place(@table, x, y, orientation, self)
  end

  def move
    @table.is_valid(@position.move) ? PlacedRobot.new(@table, @position.move) : self
  end

  def left
    PlacedRobot.new(@table, @position.left)
  end
  
  def right
    PlacedRobot.new(@table, @position.right)
  end
  
  def report
    @position.report
  end

end
