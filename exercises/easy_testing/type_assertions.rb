#Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly. 
#value may not be an instance of one of Numeric's superclasses.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTesting < MiniTest::Test
  def setup
    @value = 12
  end

  def test_type
    assert_instance_of(Numeric, @value)
  end
end
