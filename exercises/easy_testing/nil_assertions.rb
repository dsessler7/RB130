require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTesting < MiniTest::Test
  def setup
    @value = nil
  end

  def test_nil
    assert_nil(@value)
  end
end
