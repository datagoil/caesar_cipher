def caesar_cipher(string, factor)
	factor = factor.to_i		 	#turns user data into useable integer
	string_array = string.downcase.split	#turns string into array of words
	string_array.map! {|a| a.bytes.to_a}  	#turns each word into array of ints

	ciphered_array = string_array.map! do |word| 	#for each 'word' array
  		word.map! do |letter|				#take each letter
 	      		letter = letter + factor		#applies cipher
	      		letter = letter - 26 if letter > 122	#'z to a' loop implemented
	      		letter = letter.chr			#turns acsii back to character
  		end  
			word.join					#puts letters back into a word
	end
	coded_string = ciphered_array.join(" ")		#turns array of words into a string

	string.each_char.with_index do |char, index| 	#look at each char and it's index in original string
  		if (char =~ /[A-Z]/)                        	#if it is capitalized
    			coded_string[index] = coded_string[index].upcase   #capitalize the corresponding letter in new string
  		end
  		if (char !~ /[a-zA-Z]/)                       #if it's not a letter
   		coded_string[index] = string[index]          #add it to new string as originally typed
  		end
	end
	puts coded_string              			#shows coded string to user
end

puts "Enter some text and I will code it for you using a Caesar Cipher"				
string = gets.chomp
puts "Enter a number between 5-25 for my calculations"
factor = gets.chomp

caesar_cipher(string, factor)
