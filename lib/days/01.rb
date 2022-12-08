class Day01

  def part1(input)
    calculate(input).max
  end

  def part2(input)
    calculate(input).sort.reverse[0..2].sum
  end

  private

  def calculate(input)
    current = 0
    sums = []

    input.split("\n").each do |line|
      if line.empty?
        sums << current
        current = 0
      else
        current += line.to_i
      end
    end

    sums << current
    sums
  end

end
