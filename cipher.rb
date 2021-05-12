=begin

Problem
* input is a string
* output is a string that has been encrypted by shifting each letter n places
* non-letters should be ignored

Examples
* money => zbarl

Data Structure
* strings, arrays?

Algorithm:
Get array of chars
Iterate through array (map)
  if char is a letter
    convert_letter
  else
    return char as is
Join resulting array of characters into one string.

convert_letter algorithm:
if character is lowercase and the ascii code plus the rotation number is greater
  than 122, OR character is uppercase and ascii code plus the rotation number is
  greater than 90:

  (char.ord + rotation_number - 26).chr
else
  (char.ord + rotation_number).chr

Code

=end

class Cipher
  def self.rotate(str, n=13)
    str.chars.map do |char|
      if char =~ /[a-z]/i
        convert_letter(char, n % 26)
      else
        char
      end
    end.join
  end

  def self.convert_letter(char, num)
    if (char.ord >= 97 && (char.ord + num) > 122) ||
       (char.ord < 97 && (char.ord + num) > 90)

      (char.ord + num - 26).chr
    else
      (char.ord + num).chr
    end
  end
end
