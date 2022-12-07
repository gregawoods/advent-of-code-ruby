require 'debug'
require_relative '../helpers/file_reader'

module Day7
  File = Struct.new(:name, :size)

  Dir = Struct.new(:name, :parent, :dirs, :files) do
    def total_size
      files.map(&:size).sum + dirs.map(&:total_size).sum
    end

    def flatten
      [dirs.map(&:flatten)].flatten + [self]
    end
  end

  def self.parse(input)
    root = Dir.new('/', nil, [], [])
    current = root

    input[1..].each do |line|
      if line == '$ cd ..'
        current = current.parent

      elsif line.start_with? '$ cd'
        dir_name = line[5..]
        current = current.dirs.find { |d| d.name == dir_name }

      elsif line.start_with? 'dir'
        dir_name = line[4..]
        current.dirs.push(Dir.new(dir_name, current, [], []))

      elsif line[0].match(/\d/)
        split = line.split(' ')
        current.files.push(File.new(split[1], split[0].to_i))
      end
    end

    root
  end

  def self.part1(input)
    root = parse(input)

    sum = root.flatten.select do |dir|
      dir.total_size <= 100000
    end.map(&:total_size).sum

    sum
  end

  def self.part2(input)
    root = parse(input)
    space_required = 30000000 - (70000000 - root.total_size)

    root.flatten.sort_by(&:total_size).each do |dir|
      if dir.total_size >= space_required
        return dir.total_size
      end
    end

    0
  end
end

input = FileReader.array_of_strings('./inputs/07.txt')

puts "Part 1: #{Day7.part1(input)}"
puts "Part 2: #{Day7.part2(input)}"
