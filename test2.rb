my_hash = { a: 3, b: 2, c: 5 }

def test(num)
  num += 2
end

arr = ['a', 'b', 'c' ]

def convert(collection)
  collection.map do |el|
    yield(el)
  end
end

convert(arr) do |el|
  puts "#{arr} #{test(my_hash[el.to_sym])}"
end
