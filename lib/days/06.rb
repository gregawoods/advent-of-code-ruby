class Day06

  def part1(input)
    calculate(input, 4)
  end

  def part2(input)
    calculate(input, 14)
  end

  private

  def calculate(input, limit)
    list = []

    input.chars.each_with_index do |char, index|
      list << char

      list.shift if list.length > limit

      return index + 1 if list.uniq.length == limit
    end
  end

end
