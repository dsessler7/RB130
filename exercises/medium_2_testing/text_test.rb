require 'minitest/autorun'

require_relative 'text'

class TextTest < MiniTest::Test
  def setup
    @pre_swap_file = File.open('sample_text.txt')
    @expected_file = File.open('sample_text2.txt')
  end

  def test_swap
    pre_swap_text = Text.new(@pre_swap_file.read)
    expected_text = @expected_file.read
    assert_equal(expected_text, pre_swap_text.swap('a', 'e'))
  end

  def test_word_count
    text = Text.new(@pre_swap_file.read)
    assert_equal(72, text.word_count)
  end

  def teardown
    @pre_swap_file.close
    puts "File has been closed: #{@pre_swap_file.closed?}"
    @expected_file.close
    puts "File has been closed: #{@expected_file.closed?}"
  end
end
