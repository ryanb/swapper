class Swapper
  def initialize(line, position)
    @line = line
    @char_position = position
  end
  
  def divider
    [', ', ' ', ''].detect do |div|
      @line.include? div
    end
  end
  
  def part_position
    position = @line[0..@char_position].split(divider).size
    position > 1 ? position-1 : 1
  end
  
  def swapped_parts
    parts = @line.split(divider)
    temp = parts[part_position]
    parts[part_position] = parts[part_position-1]
    parts[part_position-1] = temp
    parts
  end
  
  def swap
    swapped_parts.join(divider)
  end
end
