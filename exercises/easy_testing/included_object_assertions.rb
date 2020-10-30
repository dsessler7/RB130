
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTesting < MiniTest::Test
  def setup
    @list = ['abc', 'xyz']
  end

  def test_includes
    assert_includes(@list, 'xyz')
  end
end
