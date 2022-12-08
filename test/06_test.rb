require 'minitest/autorun'
require_relative '../app'

class TestDay06 < Minitest::Test
  def setup
    @data = File.read(File.join(APP_ROOT, 'examples', '06.txt')).rstrip
    @day = Day06.new
  end

  def test_part1
    assert_equal 7, @day.part1(@data)
  end

  def test_part2
    assert_equal 19, @day.part2(@data)
  end
end
