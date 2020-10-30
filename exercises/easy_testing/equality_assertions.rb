
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTesting < MiniTest::Test
  def setup
    @value = "XyZ"
  end

  def test_odd
    assert_equal('xyz', @value.downcase)
  end
end
