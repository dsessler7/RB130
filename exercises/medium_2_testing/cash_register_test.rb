require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register1 = CashRegister.new(1000)
    @purchase1 = Transaction.new(51.50)
    @purchase1.amount_paid = 55
  end

  def test_accept_money
    @register1.accept_money(@purchase1)
    assert_equal(1055, @register1.total_money)
  end

  def test_change
    assert_equal(3.50, @register1.change(@purchase1))
  end

  def test_give_receipt
    assert_output("You've paid $51.5.\n") { @register1.give_receipt(@purchase1) }
  end
end
