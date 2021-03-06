class Swapper
  def initialize(line, position)
    @line = line
    @char_position = position
  end
  
  def target_range
    if @line.include?('(') && @line.include?(')') && !@line[0..@char_position].rindex('(').nil? && !@line[@char_position..-1].index(')').nil?
      (@line[0..@char_position].rindex('(')+1)..(@line[@char_position..-1].index(')')+@char_position-1)
    elsif divider(@line) != ' ' && @line =~ /^\s*[a-z_]+\s+[0-9a-z_]/i
      (@line[/^\s*[a-z_]+\s+/i].length)..(@line.length)
    elsif @line =~ /^\s+/
      (@line[/^\s+/].length)..(@line.length)
    else
      nil
    end
  end
  
  def divider(str = nil)
    [' || ', ' && ', ' == ', ' != ', ' <= ', ' >= ', ' < ', ' > ', ' + ', ' - ', ' * ', ' / ', ', ', ' ', ''].detect do |div|
      (str || target).include? div
    end
  end
  
  def target
    if target_range
      @line[target_range]
    else
      @line
    end
  end
  
  def prefix
    @line[0..(target_range.begin-1)] if target_range
  end
  
  def suffix
    @line[(target_range.end+1)..-1] if target_range
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
    prefix.to_s + swapped_parts.join(divider) + suffix.to_s
  end
end
