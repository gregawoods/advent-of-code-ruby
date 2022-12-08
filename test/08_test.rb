require 'minitest/autorun'
require_relative '../app'

class TestDay08 < Minitest::Test
  def setup
    @data = File.read(File.join(APP_ROOT, 'examples', '08.txt')).strip
    @day = Day08.new
  end

  def test_part1
    assert_equal @day.part1(@data), 21
  end

  def test_part2
    assert_equal @day.part2(@data), 8
  end
end
