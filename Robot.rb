# external

# represents a toy robot

class Robot

  def self.place(x, y, orientation)
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
    
    PlacedRobot.new(position)
  end
  
  def place(x, y, orientation)
    Robot.place(x, y, orientation)
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

  def initialize(position)
    @position = position
  end
  
  def place(x, y, orientation)
    Robot.place(x, y, orientation)
  end

  def move
    PlacedRobot.new(@position.move)
  end

  def left
    PlacedRobot.new(@position.left)
  end
  
  def right
    PlacedRobot.new(@position.right)
  end
  
  def report
    @position.report
  end

end

class North

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
  robot = Robot.new
  looping = true
  while looping
    input = gets.chomp
    if input.downcase == "quit"
      looping = false
    elsif input.downcase.start_with? "place " and input.count(",") == 2
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
