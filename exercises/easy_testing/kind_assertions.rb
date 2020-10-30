
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTesting < MiniTest::Test
  def setup
    @value = 12.4
  end

  def test_kind_of
    assert_kind_of(Numeric, @value)
  end
end
