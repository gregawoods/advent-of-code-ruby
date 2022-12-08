class Day03

  ALPHABET = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.freeze

  def part1(input)
    input.split("\n").map do |line|
      len = line.length / 2
      left = line[0..(len - 1)].chars
      right = line[len..].chars

      1 + ALPHABET.index(left.intersection(right).first)
    end.sum
  end

  def part2(input)
    input.split("\n").each_slice(3).map do |slice|
      str_a = slice[0].chars
      str_b = slice[1].chars
      str_c = slice[2].chars

      1 + ALPHABET.index(
        str_a.intersection(str_b).intersection(str_c).first
      )
    end.sum
  end

end
