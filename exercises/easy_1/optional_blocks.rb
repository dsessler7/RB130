def compute(arg)
  block_given? ? yield(arg) : 'Does not compute.'
end

puts compute(2) { |num| 5 + 3 + num } == 10
puts compute('c') { |letter| 'a' + 'b' + letter } == 'abc'
puts compute(nil) == 'Does not compute.'
