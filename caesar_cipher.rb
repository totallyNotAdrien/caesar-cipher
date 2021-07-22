require 'pry-byebug'

alphabet = ["a", "b", "c", "d", "e", "f", "g", "h",
            "i", "j", "k", "l", "m", "n", "o", "p", "q",
            "r", "s", "t", "u", "v", "w", "x", "y", "z"]
cap_alphabet = ["A", "B", "C", "D", "E", "F", "G",
                "H", "I", "J", "K", "L", "M", "N", "O", "P",
                "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

def caesar_cipher(str, rot)
  new_str = str.split("").map do |char|
    arr = nil
    binding.pry
    #check which alphabet array char is in, if either
    index = alphabet.find_index(char)
    if index
      arr = alphabet
    else
      index = cap_alphabet.find_index(char)
      arr = index ? cap_alphabet : nil
    end

    #char is in one of the alphabet arrays
    if index && arr
      #wrap around
      index = (index + arr.length + rot) % arr.length
      #return shifted (and potentially wrapped) char
      arr[index]
    #otherwise, keep same char
    else
      char
    end
  end
  new_str
end

puts caesar_cipher("Milkshakes are the best milk thing, dude!", -3)
