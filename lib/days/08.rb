class Day08

  def part1(input)
    forest = []

    input.split("\n").each do |line|
      forest << []

      line.each_char do |char|
        forest.last << char.to_i
      end
    end

    count = 0

    forest.each_with_index do |row, row_index|
      row.each_with_index do |tree, col_index|

        # edges count
        if row_index.zero? || row_index >= (forest.length - 1) || col_index.zero? || col_index >= (row.length - 1)
          count += 1
          next
        end

        if tree > row[0..(col_index - 1)].max
          count += 1
          next
        end

        if tree > row[(col_index + 1)..].max
          count += 1
          next
        end

        if tree > forest[0..(row_index - 1)].map { |r| r[col_index] }.max
          count += 1
          next
        end

        if tree > forest[(row_index + 1)..].map { |r| r[col_index] }.max
          count += 1
          next
        end
      end
    end

    count
  end

  def part2(input)
    forest = []

    input.split("\n").each do |line|
      forest << []

      line.each_char do |char|
        forest.last << char.to_i
      end
    end

    best = 0

    forest.each_with_index do |row, row_index|
      row.each_with_index do |tree, col_index|
        # seems like we should skip edges
        next if row_index.zero? || row_index >= (forest.length - 1) || col_index.zero? || col_index >= (row.length - 1)

        scores = [0, 0, 0, 0]

        row[0..(col_index - 1)].reverse.each do |t|
          scores[0] += 1
          break if t >= tree
        end

        row[(col_index + 1)..].each do |t|
          scores[1] += 1
          break if t >= tree
        end

        forest[0..(row_index - 1)].map { |r| r[col_index] }.reverse.each do |t|
          scores[2] += 1
          break if t >= tree
        end

        forest[(row_index + 1)..].map { |r| r[col_index] }.each do |t|
          scores[3] += 1
          break if t >= tree
        end

        score = scores.inject(:*)
        best = score if score > best
      end
    end

    best
  end

end
