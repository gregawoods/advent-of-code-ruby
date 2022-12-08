require 'minitest/autorun'
require_relative '../app'

class TestDay07 < Minitest::Test
  def setup
    @data = File.read(File.join(APP_ROOT, 'examples', '07.txt')).strip
    @day = Day07.new
  end

  def test_part1
    assert_equal @day.part1(@data), 95437
  end

  def test_part2
    assert_equal @day.part2(@data), 24933642
  end
end
