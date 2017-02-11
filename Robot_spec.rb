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
      @robot = @robot.place(0, 0, :north)
      expect(@robot.report).to eq("0,0,NORTH")
    end

    it "ignores move" do
      @robot = Robot.new(@table)
      @robot = @robot.move
      expect(@robot.report).to eq("UNPLACED")
    end

    it "ignores left" do
      @robot = Robot.new(@table)
      @robot = @robot.left
      expect(@robot.report).to eq("UNPLACED")
    end

    it "ignores right" do
      @robot = Robot.new(@table)
      @robot = @robot.right
      expect(@robot.report).to eq("UNPLACED")
    end

    it "responds to report" do
      @robot = Robot.new(@table)
      expect(@robot.report).to eq("UNPLACED")
    end

  end

  describe "that is placed" do

    it "responds to place" do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 0, :north)
      @robot = @robot.place(4, 4, :south)
      expect(@robot.report).to eq("4,4,SOUTH")
    end

    it "responds to move" do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 0, :north)
      @robot = @robot.move
      expect(@robot.report).to eq("0,1,NORTH")
    end

    it "responds to left" do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 0, :north)
      @robot = @robot.left
      expect(@robot.report).to eq("0,0,WEST")
    end

    it "responds to right" do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 0, :north)
      @robot = @robot.right
      expect(@robot.report).to eq("0,0,EAST")
    end

    it "responds to report" do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 0, :north)
      expect(@robot.report).to eq("0,0,NORTH")
    end

  end

  describe "can be placed in corner" do

    it "southwest" do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 0, :north)
      expect(@robot.report).to eq("0,0,NORTH")
    end

    it "northwest" do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 4, :north)
      expect(@robot.report).to eq("0,4,NORTH")
    end

    it "northeast" do
      @robot = Robot.new(@table)
      @robot = @robot.place(4, 4, :north)
      expect(@robot.report).to eq("4,4,NORTH")
    end

    it "southeast" do
      @robot = Robot.new(@table)
      @robot = @robot.place(4, 0, :north)
      expect(@robot.report).to eq("4,0,NORTH")
    end

  end

  describe "is prevented from falling off edge" do

    it :north do
      @robot = Robot.new(@table)
      @robot = @robot.place(2, 4, :north)
      @robot = @robot.move
      expect(@robot.report).to eq("2,4,NORTH")
    end

    it :east do
      @robot = Robot.new(@table)
      @robot = @robot.place(4, 2, :east)
      @robot = @robot.move
      expect(@robot.report).to eq("4,2,EAST")
    end

    it :south do
      @robot = Robot.new(@table)
      @robot = @robot.place(2, 0, :south)
      @robot = @robot.move
      expect(@robot.report).to eq("2,0,SOUTH")
    end

    it :west do
      @robot = Robot.new(@table)
      @robot = @robot.place(0, 2, :west)
      @robot = @robot.move
      expect(@robot.report).to eq("0,2,WEST")
    end

  end

end
