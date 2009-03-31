class Swapper
  def initialize(line, position)
    @line = line
    @position = position
  end
  
  def swap
    if @position > 0 && @position < @line.length
      temp = @line[@position]
      @line[@position] = @line[@position-1]
      @line[@position-1] = temp
    end
    @line
  end
end
