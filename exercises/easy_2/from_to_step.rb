def step(start_value, end_value, step_value)
  current_value = start_value
  iterations = 0
  while current_value < end_value
    yield(current_value)
    current_value += step_value
    iterations += 1
  end
  yield(end_value)
  iterations += 1
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
