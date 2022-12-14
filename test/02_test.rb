require 'minitest/autorun'
require_relative '../app'

class TestDay02 < Minitest::Test
  def setup
    @data = File.read(File.join(APP_ROOT, 'examples', '02.txt')).rstrip
    @day = Day02.new
  end

  def test_part1
    assert_equal 15, @day.part1(@data)
  end

  def test_part2
    assert_equal 12, @day.part2(@data)
  end
end
