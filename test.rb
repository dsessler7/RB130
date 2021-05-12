def method_1(&block)
  puts "We're in method_1."
  method_2(block)
end

def method_2(proc_object)
  puts "We're in method_2."
  proc_object.call
end

method_1 { puts "This is the block." }

def times_three_and_then(num)
  yield(num * 3)
end

times_three_and_then(3) { |num| puts num }

def implicit_block
  puts "In the method and yielding to the block:"
  yield if block_given?
  puts "Back in the method."
end

implicit_block # { puts "Now we're inside the block." }

def print_greeting(proc)
  puts proc.call
end

name = "Drew"
proc = Proc.new { "Hello, #{name}" }
print_greeting(proc)

def take_dog_out
  print "Grab Spot's leash and head out to go "
  yield
end

take_dog_out { puts "to the groomers." }

def time_this_block
  t1 = Time.now
  yield
  t2 = Time.now
  puts "It took #{t2 - t1} seconds to run that block."
end

time_this_block { puts "This should be quick." }

[1, 2, 3].each do |num|
  puts num
end


def pass_two_args(arg1, arg2)
  yield(arg1, arg2)
end

pass_two_args(1, 2) { |num| puts "We're number #{num}." }

def pass_one_arg(arg)
  yield(arg)
end

pass_one_arg(1) { |num1, num2, num3| puts "#{num1}, #{num2}, #{num3}, 4" }


p [1, 3, 5, 7, 9, 11].all? do |num|
  num.odd?
end

p [1, 3, 5, 7, 9, 11].all?(&:odd?)

def timer
  if block_given?
    t1 = Time.now
    10_000_000.times { yield }
    t2 = Time.now
    puts "#{t2 - t1} seconds"
  else
    raise RuntimeError, "No block given"
  end
end

timer { |x| i = x.to_s } # 1.731092053 seconds

timer # No block given (RuntimeError)