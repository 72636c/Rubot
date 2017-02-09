require "rspec"
require "./Robot"

describe "Robot" do

  describe "not placed" do

    it "responds to report" do
      @robot = Robot.new
      expect(@robot.report).to eq("not placed")
    end

    it "responds to place" do
      @robot = Robot.new
      @robot = @robot.place(0, 0, :north)
      expect(@robot.report).to eq("at (0, 0) facing north")
    end

  end

  describe "placed" do

    it "responds to report" do
      @robot = Robot.new
      @robot = @robot.place(0, 0, :north)
      expect(@robot.report).to eq("at (0, 0) facing north")
    end

    it "responds to place" do
      @robot = Robot.new
      @robot = @robot.place(0, 0, :north)
      @robot = @robot.place(4, 4, :south)
      expect(@robot.report).to eq("at (4, 4) facing south")
    end

  end

end
