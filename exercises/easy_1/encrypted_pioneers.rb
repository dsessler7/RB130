=begin

Problem
* input is a string
* output is a string where each character is rotated 13 places in the alphabet

Examples
* 

Data Structure
* strings, integers

Algorithm


Code

=end

ALPHABET = ('a'..'z').to_a

def rot13(letter)
  return letter unless ALPHABET.include?(letter.downcase)

  output = ALPHABET[ALPHABET.index(letter.downcase) - 13]
  output = output.upcase if letter.ord < 97
  output
end

text = File.open('pioneers.txt')
text.each_line do |line|
  line.each_char { |letter| print rot13(letter) }
end
