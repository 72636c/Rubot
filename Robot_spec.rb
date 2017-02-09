require "rspec"
require "./Robot"

describe "Robot" do

  describe "not placed" do

    it "responds to place" do
      @robot = Robot.new
      @robot = @robot.place(0, 0, "north")
      expect(@robot.report).to eq("at (0, 0) facing north")
    end

    it "ignores move" do
      @robot = Robot.new
      @robot = @robot.move
      expect(@robot.report).to eq("not placed")
    end

    it "ignores left" do
      @robot = Robot.new
      @robot = @robot.left
      expect(@robot.report).to eq("not placed")
    end

    it "ignores right" do
      @robot = Robot.new
      @robot = @robot.right
      expect(@robot.report).to eq("not placed")
    end

    it "responds to report" do
      @robot = Robot.new
      expect(@robot.report).to eq("not placed")
    end

  end

  describe "placed" do

    it "responds to place" do
      @robot = Robot.new
      @robot = @robot.place(0, 0, "north")
      @robot = @robot.place(4, 4, "south")
      expect(@robot.report).to eq("at (4, 4) facing south")
    end

    it "responds to move" do
      @robot = Robot.new
      @robot = @robot.place(0, 0, "north")
      @robot = @robot.move
      expect(@robot.report).to eq("at (0, 1) facing north")
    end

    it "responds to left" do
      @robot = Robot.new
      @robot = @robot.place(0, 0, "north")
      @robot = @robot.left
      expect(@robot.report).to eq("at (0, 0) facing west")
    end

    it "responds to right" do
      @robot = Robot.new
      @robot = @robot.place(0, 0, "north")
      @robot = @robot.right
      expect(@robot.report).to eq("at (0, 0) facing east")
    end

    it "responds to report" do
      @robot = Robot.new
      @robot = @robot.place(0, 0, "north")
      expect(@robot.report).to eq("at (0, 0) facing north")
    end

  end

end
