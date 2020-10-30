require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_raise_adding_nontodo
    assert_raises(TypeError) do
      @list.add(1)
    end
  end

  def test_shovel
    @list << @todo1
    assert_equal([@todo1, @todo2, @todo3, @todo1], @list.to_a)
  end

  def test_add
    @list.add(@todo2)
    assert_equal([@todo1, @todo2, @todo3, @todo2], @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) do
      @list.item_at(3)
    end
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) do
      @list.mark_done_at(3)
    end
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(3) }
    @list.done!
    assert_equal(true, @list.done?)
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(3) }
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    text = <<~TEXT
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    TEXT

    assert_equal(text, @list.to_s)
  end

  def test_to_s_one_done
    text = <<~TEXT
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    TEXT

    @list.mark_done_at(0)
    assert_equal(text, @list.to_s)
  end

  def test_to_s_all_done
    text = <<~TEXT
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    TEXT

    @list.done!
    assert_equal(text, @list.to_s)
  end

  def test_each
    test_arr = []
    temp_list = @list.each { |todo| test_arr << todo }

    assert_equal(@list.to_a, test_arr)
    assert_equal(@list, temp_list)
  end

  def test_select
    @list.mark_done_at(0)
    select_list = @list.select { |todo| todo.done? }

    assert_equal([@todo1], select_list.to_a)
    assert_equal("Selected from #{@list.title}", select_list.title)
    assert_instance_of(TodoList, select_list)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title("Buy milk"))
  end

  def test_all_done
    @todo1.done!
    @todo2.done!
    assert_equal([@todo1, @todo2], @list.all_done.to_a)
  end

  def test_all_not_done
    @todo1.done!
    @todo2.done!
    assert_equal([@todo3], @list.all_not_done.to_a)
  end

end
