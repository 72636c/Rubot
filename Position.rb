# represents a possible position for a robot on a table top

class North

  attr_reader :x, :y
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

  attr_reader :x, :y
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

  attr_reader :x, :y
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

  attr_reader :x, :y
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
