# external

# represents a toy robot

class Robot

  def place(x, y, orientation)
    PlacedRobot.new(x, y, orientation)
  end

  def report
    "not placed"
  end

end

# internal

# represents a toy robot that has been placed on a tabletop

class PlacedRobot

  def initialize(x, y, orientation)
    @x = x
    @y = y
    @orientation = orientation
  end
  
  def place(x, y, orientation)
    PlacedRobot.new(x, y, orientation)
  end

  def report
    "at (#{@x}, #{@y}) facing #{@orientation}"
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
      robot = robot.place(parameters[0].strip, parameters[1].strip, parameters[2].strip)
    elsif input.downcase == "report"
      puts robot.report
    end
  end
end
