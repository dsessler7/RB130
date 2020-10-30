factorial = Enumerator.new do |f|
  n = m = 1
  f << m
  loop do
    f << m
    n += 1
    m *= n
  end
end

7.times { p factorial.next }
3.times { p factorial.next }
factorial.rewind
7.times { p factorial.next }

factorial.each do |n| 
  puts n
  break if n > 10
end

factorial.each do |n| 
  puts n
  break if n > 100
end
