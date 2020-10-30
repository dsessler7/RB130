=begin

Problem
* input is a number
* output is all divisors of that number

Examples
* 1 => [1]
* 4 => [1, 2, 4]
etc

Data Structure
* numbers, arrays

Algorithm
SET output = [1, num] (since we know that the number is always divisible by 1 and itself)
SET divisor = 2
LOOP
  output << divisor << (num / divisor) if (num / divisor).integer?
  divisor += 1
  break if divisor > the square root of the input number
end
sort and get rid of duplicates
return output

Code

=end

def divisors(input)
  output = [1, input]
  (2..Math.sqrt(input).floor).each do |divisor|
    output << divisor << (input / divisor) if (input % divisor).zero?
  end
  output.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357)
