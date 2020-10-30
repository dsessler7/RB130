
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTesting < MiniTest::Test
  def setup
    @value = 12
    @value_2 = 12
  end

  def test_same
    assert_same(@value_2, @value)
  end
end
