require 'minitest/autorun'
require_relative '../app'

class TestDay04 < Minitest::Test
  def setup
    @data = File.read(File.join(APP_ROOT, 'examples', '04.txt')).rstrip
    @day = Day04.new
  end

  def test_part1
    assert_equal 2, @day.part1(@data)
  end

  def test_part2
    assert_equal 4, @day.part2(@data)
  end
end
