require "rspec"
require "./Robot"

describe "Robot" do

  before(:all) do
    @robot = Robot.new(0, 0, :north)
  end

  it "reports" do
    expect(@robot.report).to eq("at (0, 0) facing north")
  end

end
