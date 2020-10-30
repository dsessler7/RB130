# Write a minitest assertion that will fail if the value.odd? is not true.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTesting < MiniTest::Test
  def setup
    @value = 1
  end

  def test_odd
    assert_equal(true, @value.odd?)
  end
end
