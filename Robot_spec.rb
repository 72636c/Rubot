require "rspec"
require "./Position"
require "./Robot"
require "./Table"

describe "Robot" do

  before(:all) do
    @table = Table.new
  end

  describe "that is not placed" do

    it "responds to place" do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 0, "NORTH")
      expect(@robot.report).to eq("at (0, 0) facing north")
    end

    it "ignores move" do
      @robot = Robot.new(@table)
      @robot = @robot.move
      expect(@robot.report).to eq("not placed")
    end

    it "ignores left" do
      @robot = Robot.new(@table)
      @robot = @robot.left
      expect(@robot.report).to eq("not placed")
    end

    it "ignores right" do
      @robot = Robot.new(@table)
      @robot = @robot.right
      expect(@robot.report).to eq("not placed")
    end

    it "responds to report" do
      @robot = Robot.new(@table)
      expect(@robot.report).to eq("not placed")
    end

  end

  describe "that is placed" do

    it "responds to place" do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 0, "NORTH")
      @robot = @robot.place(4, 4, "SOUTH")
      expect(@robot.report).to eq("at (4, 4) facing south")
    end

    it "responds to move" do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 0, "NORTH")
      @robot = @robot.move
      expect(@robot.report).to eq("at (0, 1) facing north")
    end

    it "responds to left" do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 0, "NORTH")
      @robot = @robot.left
      expect(@robot.report).to eq("at (0, 0) facing west")
    end

    it "responds to right" do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 0, "NORTH")
      @robot = @robot.right
      expect(@robot.report).to eq("at (0, 0) facing east")
    end

    it "responds to report" do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 0, "NORTH")
      expect(@robot.report).to eq("at (0, 0) facing north")
    end

  end

  describe "can be placed in corner" do

    it "southwest" do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 0, "NORTH")
      expect(@robot.report).to eq("at (0, 0) facing north")
    end

    it "northwest" do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 4, "NORTH")
      expect(@robot.report).to eq("at (0, 4) facing north")
    end

    it "northeast" do
      @robot = Robot.new(@table)
      @robot = @robot.place(4, 4, "NORTH")
      expect(@robot.report).to eq("at (4, 4) facing north")
    end

    it "southeast" do
      @robot = Robot.new(@table)
      @robot = @robot.place(4, 0, "NORTH")
      expect(@robot.report).to eq("at (4, 0) facing north")
    end

  end

  describe "is prevented from falling off edge" do

    it "NORTH" do
      @robot = Robot.new(@table)
      @robot = @robot.place(2, 4, "NORTH")
      @robot = @robot.move
      expect(@robot.report).to eq("at (2, 4) facing north")
    end

    it "EAST" do
      @robot = Robot.new(@table)
      @robot = @robot.place(4, 2, "EAST")
      @robot = @robot.move
      expect(@robot.report).to eq("at (4, 2) facing east")
    end

    it "SOUTH" do
      @robot = Robot.new(@table)
      @robot = @robot.place(2, 0, "SOUTH")
      @robot = @robot.move
      expect(@robot.report).to eq("at (2, 0) facing south")
    end

    it "WEST" do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 2, "WEST")
      @robot = @robot.move
      expect(@robot.report).to eq("at (0, 2) facing west")
    end

  end

end
