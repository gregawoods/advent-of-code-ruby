require 'set'

class Day09

  def part1(input)
    head = [0, 0]
    tail = [0, 0]

    visited = Set.new
    visited << tail.join(',')

    input.split("\n").map(&:split).each do |step|
      step[1].to_i.times do
        case step[0]
        when 'R'
          head[0] += 1
        when 'L'
          head[0] -= 1
        when 'U'
          head[1] += 1
        when 'D'
          head[1] -= 1
        end

        tail = follow(head, tail)
        visited << tail.join(',')
      end
    end

    visited.count
  end

  def part2(input)
    head = [0, 0]
    knots = 9.times.map { [0, 0] }

    visited = Set.new
    visited << knots.last.join(',')

    input.split("\n").map(&:split).each do |step|
      step[1].to_i.times do
        case step[0]
        when 'R'
          head[0] += 1
        when 'L'
          head[0] -= 1
        when 'U'
          head[1] += 1
        when 'D'
          head[1] -= 1
        end

        9.times do |index|
          reference = index.zero? ? head : knots[index - 1]

          knots[index] = follow(reference, knots[index])
        end

        # debugger
        visited << knots.last.join(',')
      end
    end

    # debugger
    visited.count

    # 2487 too high
    # 2485 too high
  end

  private

  def touching?(point_a, point_b)
    return true if point_a == point_b

    dist_x = (point_a[0] - point_b[0]).abs
    dist_y = (point_a[1] - point_b[1]).abs

    dist_x <= 1 && dist_y <= 1
  end

  # return a new point where tail follows head
  def follow(head, tail_in)
    # copy the point
    tail = [tail_in[0], tail_in[1]]

    return tail if touching?(head, tail)

    if head[1] == tail[1]
      # horizontal move
      if tail[0] < head[0]
        tail[0] += 1
      else
        tail[0] -= 1
      end

    elsif head[0] == tail[0]
      # vertical move
      if tail[1] < head[1]
        tail[1] += 1
      else
        tail[1] -= 1
      end
    else
      # diagonal move
      if head[0] - tail[0] > 1
        # move right
        tail[0] += 1
        tail[1] = head[1]
      elsif tail[0] - head[0] > 1
        # move left
        tail[0] -= 1
        tail[1] = head[1]
      elsif head[1] - tail[1] > 1
        # move up
        tail[1] += 1
        tail[0] = head[0]
      elsif tail[1] - head[1] > 1
        # move down
        tail[1] -= 1
        tail[0] = head[0]
      end
    end

    tail
  end

end
