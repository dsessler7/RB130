
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTesting < MiniTest::Test
  def setup
    @list = []
    @employee = Employee.new("ben")
  end

  def test_exception
    assert_raises(NoExperienceError) do 
      @employee.hire
    end
  end
end
