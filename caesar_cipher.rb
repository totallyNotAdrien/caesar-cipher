def caesar_cipher(str, rot)
  alphabet = ["a", "b", "c", "d", "e", "f", "g", "h",
              "i", "j", "k", "l", "m", "n", "o", "p", "q",
              "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  cap_alphabet = ["A", "B", "C", "D", "E", "F", "G",
                  "H", "I", "J", "K", "L", "M", "N", "O", "P",
                  "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  return "" if str.empty?
  
  new_str = str.split("").map do |char|
    arr = nil
    #check which alphabet array char is in, iff either
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
    else
      #otherwise, return same char
      char
    end
  end
  new_str.join("")
end

puts caesar_cipher("Milkshakes are the best milk thing, dude!", -3)

def quit?(input)
  input.downcase == "q" || input.downcase == "quit"
end

input = ""
until quit?(input) do
  print "Enter the message to encode or 'q' or 'quit' to quit: "
  input = gets.chomp.strip
  break if quit?(input)

  print "Enter the shift factor: "
  rot = gets.chomp.strip.to_i
  puts caesar_cipher(input, rot)
end
