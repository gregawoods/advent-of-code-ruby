require 'minitest/autorun'
require_relative '../app'

class TestDay03 < Minitest::Test
  def setup
    @data = File.read(File.join(APP_ROOT, 'examples', '03.txt')).rstrip
    @day = Day03.new
  end

  def test_part1
    assert_equal 157, @day.part1(@data)
  end

  def test_part2
    assert_equal 70, @day.part2(@data)
  end
end
