require 'minitest/autorun'
#require 'minitest/reporters'
#Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < MiniTest::Test

  def test_prompt_for_payment
    @transaction = Transaction.new(30)
    input = StringIO.new("30\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal("You owe $#{@transaction.item_cost}.\nHow much are you paying?\n", output.string)
    assert_equal(30, @transaction.amount_paid)
  end
end