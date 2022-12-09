require 'minitest/autorun'
require_relative '../app'

class TestDay09 < Minitest::Test
  def setup
    @data = File.read(File.join(APP_ROOT, 'examples', '09.txt')).rstrip
    @data_2 = File.read(File.join(APP_ROOT, 'examples', '09_02.txt')).rstrip

    @day = Day09.new
  end

  def test_part1
    assert_equal 13, @day.part1(@data)
  end

  def test_part2
    assert_equal 36, @day.part2(@data_2)
  end
end
