def mutate_me(arr, &block)
  return arr unless block_given?
  arr.map!(&block)
end

arr = [1,2,3]
p mutated_arr = mutate_me(arr) { |el| el + 5 } # [6,7,8]
p arr.object_id == mutated_arr.object_id # true

p mutate_me(['a','b','c']) { |el| el.upcase } # ['A', 'B', 'C']

output = mutate_me([[1,2], [2,3], [3,4], 'a', 'b', 'c']) do |el|
  el.is_a?(Array) ? el.reverse : el
end # [[2, 1], [3, 2], [4, 3], "a", "b", "c"]
p output

arr2 = [1,2,3]

p same_arr2 = mutate_me(arr2)
p arr2.object_id == same_arr2.object_id
