class Swapper
  def initialize(line, position)
    @line = line
    @position = position
  end
  
  def swap
    if @line.include? ' '
      position = (@line[0..@position].split(' ').size)
      position -= 1 if position > 1
      parts = @line.split(' ')
      temp = parts[position]
      parts[position] = parts[position-1]
      parts[position-1] = temp
      @line = parts.join(' ')
    else
      if @position > 0 && @position < @line.length
        temp = @line[@position]
        @line[@position] = @line[@position-1]
        @line[@position-1] = temp
      end
    end
    @line
  end
end
