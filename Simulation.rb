require "./Position"
require "./Robot"
require "./Table"

# represents a program that receives command line input and simulates a robot moving across a table top

class Simulation

  def self.run
    @robot = Robot.new(Table.new)
    
    loop do
      input = gets
      break unless input
      Simulation.process(input)
    end
  end
  
  def self.process(input)
    input = input.strip.upcase
    
    if input =~ /^PLACE [0-9]+,[0-9]+,(NORTH|EAST|SOUTH|WEST)$/
      parameters = input.partition("PLACE ").last.split(",")
      @robot = @robot.place(parameters[0].strip.to_i, parameters[1].strip.to_i, parameters[2].strip)
    elsif input == "MOVE"
      @robot = @robot.move
    elsif input == "LEFT"
      @robot = @robot.left
    elsif input == "RIGHT"
      @robot = @robot.right
    elsif input == "REPORT"
      puts @robot.report
    else
      puts "invalid command"
    end
  end

end

if __FILE__ == $0
  Simulation.run
end
