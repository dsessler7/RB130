#Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly. 
#value may not be an instance of one of Numeric's superclasses.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTesting < MiniTest::Test
  def setup
    @list = ['abc']
  end

  def test_refutations
    refute_includes(@list, 'xyz')
  end
end
