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
  
  def target
    if @line.include?('(') && @line.include?(')')
      @line.split(/[()]/)[1]
    else
      @line
    end
  end
  
  def prefix
    if @line.include?('(') && @line.include?(')')
      @line.split(/[()]/)[0] + '('
    else
      ''
    end
  end
  
  def suffix
    if @line.include?('(') && @line.include?(')')
      ')' + @line.split(/[()]/)[2].to_s
    else
      ''
    end
  end
  
  def part_position
    position = target[0..@char_position].split(divider).size
    position > 1 ? position-1 : 1
  end
  
  def swapped_parts
    parts = target.split(divider)
    temp = parts[part_position]
    parts[part_position] = parts[part_position-1]
    parts[part_position-1] = temp
    parts
  end
  
  def swap
    prefix + swapped_parts.join(divider) + suffix
  end
end
