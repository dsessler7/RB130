items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*produce, grain|
  puts produce.join(', ')
  puts grain
end

gather(items) do |fruit, *vegetables, grain|
  puts fruit
  puts vegetables.join(', ')
  puts grain
end

gather(items) do |fruit, *others|
  puts fruit
  puts others.join(', ')
end

gather(items) do |a, b, c, d|
  puts "#{a}, #{b}, #{c}, and #{d}"
end
