class Day04

  def part1(input)
    input.split("\n").count do |line|
      numbers = line.scan(/\d+/).map(&:to_i)

      (numbers[0] <= numbers[2] && numbers[1] >= numbers[3]) || (numbers[0] >= numbers[2] && numbers[1] <= numbers[3])
    end
  end

  def part2(input)
    input.split("\n").count do |line|
      numbers = line.scan(/\d+/).map(&:to_i)

      (numbers[0] <= numbers[3] && numbers[1] >= numbers[2]) || (numbers[2] >= numbers[1] && numbers[3] <= numbers[0])
    end
  end

end
