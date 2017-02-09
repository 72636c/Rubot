# external

# represents a table top that a robot navigates

class Table

  def initialize(width, height)
    @width = width
    @height = height
  end

  def is_valid(position)
    position.x < @width && position.y < @height && position.x >= 0 && position.y >= 0
  end

end

# represents a toy robot

class Robot

  def self.place(table, x, y, orientation, robot)
    case orientation
    when "north"
      position = North.new(x, y)
    when "east"
      position = East.new(x, y)
    when "south"
      position = South.new(x, y)
    when "west"
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
    "not placed"
  end

end

# internal

# represents a toy robot that has been placed on a tabletop

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

class North

  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def move
    North.new(@x, @y + 1)
  end

  def left
    West.new(@x, @y)
  end
  
  def right
    East.new(@x, @y)
  end

  def report
    "at (#{@x}, #{@y}) facing north"
  end

end

class East

  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def move
    East.new(@x + 1, @y)
  end

  def left
    North.new(@x, @y)
  end
  
  def right
    South.new(@x, @y)
  end

  def report
    "at (#{@x}, #{@y}) facing east"
  end

end

class South

  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def move
    South.new(@x, @y - 1)
  end

  def left
    East.new(@x, @y)
  end
  
  def right
    West.new(@x, @y)
  end

  def report
    "at (#{@x}, #{@y}) facing south"
  end

end

class West

  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
  
  def move
    West.new(@x - 1, @y)
  end

  def left
    South.new(@x, @y)
  end
  
  def right
    North.new(@x, @y)
  end

  def report
    "at (#{@x}, #{@y}) facing west"
  end

end

if __FILE__ == $0
  table = Table.new(5, 5)
  robot = Robot.new(table)
  looping = true
  while looping
    input = gets.chomp.strip
    if input.downcase == "quit"
      looping = false
    elsif input.downcase =~ /^place [0-9]+,[0-9]+,(north|east|south|west)$/
      parameters = input.downcase.partition("place ").last.split(",")
      robot = robot.place(parameters[0].strip.to_i, parameters[1].strip.to_i, parameters[2].strip)
    elsif input.downcase == "move"
      robot = robot.move
    elsif input.downcase == "left"
      robot = robot.left
    elsif input.downcase == "right"
      robot = robot.right
    elsif input.downcase == "report"
      puts robot.report
    else
      puts "invalid command"
    end
  end
end
