# represents a program that receives command line input and simulates a robot moving across a table top

table = Table.new(5, 5)
robot = Robot.new(table)
looping = true
while looping
  input = gets.strip.upcase
  if input == "QUIT"
    looping = false
  elsif input =~ /^PLACE [0-9]+,[0-9]+,(north|east|south|west)$/
    parameters = input.partition("PLACE ").last.split(",")
    robot = robot.place(parameters[0].strip.to_i, parameters[1].strip.to_i, parameters[2].strip)
  elsif input == "MOVE"
    robot = robot.move
  elsif input == "LEFT"
    robot = robot.left
  elsif input == "RIGHT"
    robot = robot.right
  elsif input == "REPORT"
    puts robot.report
  else
    puts "invalid command"
  end
end
