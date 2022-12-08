class Day05

  def part1(input)
    stacks, moves = extract(input)

    moves.each do |m|
      m.number.times do
        value = stacks[m.from - 1].shift
        stacks[m.to - 1].unshift(value)
      end
    end

    stacks.map(&:first).join
  end

  def part2(input)
    stacks, moves = extract(input)

    moves.each do |m|
      temp = []

      m.number.times do
        temp << stacks[m.from - 1].shift
      end

      stacks[m.to - 1] = temp + stacks[m.to - 1]
    end

    stacks.map(&:first).join
  end

  private

  Move = Struct.new(:number, :from, :to)

  def extract(input)
    stacks = []
    moves = []

    input.split("\n").each do |line|
      if line.include?('[')
        line.chars.each_slice(4).with_index do |slice, index|
          stacks << [] if stacks.length <= index
          stacks[index] << slice[1] unless slice[1] == ' '
        end

      elsif line.start_with?('move')
        numbers = line.scan(/\d+/).map(&:to_i)
        moves << Move.new(*numbers)
      end
    end

    return stacks, moves
  end

end
