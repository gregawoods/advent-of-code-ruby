class Day02

  def part1(input)
    point_values = { 'X' => 1, 'Y' => 2, 'Z' => 3 }

    input.split("\n").map do |line|
      result_one(line[0], line[2]) + point_values[line[2]]
    end.sum
  end

  def part2(input)
    point_values = { 'X' => 0, 'Y' => 3, 'Z' => 6 }

    input.split("\n").map do |line|
      result_two(line[0], line[2]) + point_values[line[2]]
    end.sum
  end

  private

  def result_one(left, right)
    if left == 'A'
      case right
      when 'X'
        3
      when 'Y'
        6
      else
        0
      end
    elsif left == 'B'
      case right
      when 'X'
        0
      when 'Y'
        3
      else
        6
      end
    elsif right == 'X'
      6
    elsif right == 'Y'
      0
    else
      3
    end
  end

  def result_two(left, right)
    case right
    when 'X'
      # lose case
      case left
      when 'A'
        3
      when 'B'
        1
      else
        2
      end
    when 'Y'
      # draw case
      case left
      when 'A'
        1
      when 'B'
        2
      else
        3
      end
    else
      # win case
      case left
      when 'A'
        2
      when 'B'
        3
      else
        1
      end
    end
  end

end
