class Day07
  File = Struct.new(:name, :file_size)

  Dir = Struct.new(:name, :parent, :dirs, :files) do
    def total_size
      files.map(&:file_size).sum + dirs.map(&:total_size).sum
    end

    def flatten
      [dirs.map(&:flatten)].flatten + [self]
    end
  end

  def part1(input)
    root = parse(input)

    root.flatten.select do |dir|
      dir.total_size <= 100_000
    end.map(&:total_size).sum
  end

  def part2(input)
    root = parse(input)
    space_required = 30_000_000 - (70_000_000 - root.total_size)

    root.flatten.sort_by(&:total_size).each do |dir|
      return dir.total_size if dir.total_size >= space_required
    end

    0
  end

  private

  def parse(input)
    root = Dir.new('/', nil, [], [])
    current = root

    input.split("\n")[1..].each do |line|
      if line == '$ cd ..'
        current = current.parent

      elsif line.start_with? '$ cd'
        dir_name = line[5..]
        current = current.dirs.find { |d| d.name == dir_name }

      elsif line.start_with? 'dir'
        dir_name = line[4..]
        current.dirs.push(Dir.new(dir_name, current, [], []))

      elsif line[0].match(/\d/)
        split = line.split
        current.files.push(File.new(split[1], split[0].to_i))
      end
    end

    root
  end
end
