class Robot

  def initialize(x, y, orientation)
    @x = x
    @y = y
    @orientation = orientation
  end

  def report
    "at (#{@x}, #{@y}) facing #{@orientation}"
  end

end

if __FILE__ == $0
  robot = Robot.new(0, 0, :north)
  looping = true
  while looping
    input = gets.chomp
    case input.downcase
    when "report"
      puts robot.report
    when "quit"
      looping = false
    end
  end
end
