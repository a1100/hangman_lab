def draw_man(number)
  drawman = []
  drawman.push " _______________ "
  drawman.push "|       |       |"
  drawman.push "|       @       |"
  drawman.push "|      /|\\      |"
  drawman.push "|       |       |"
  drawman.push "|      / \\      |"
  drawman.push "|_______________|"

  if number == 0
    drawman[2] = "|               |"
    drawman[3] = "|               |"
    drawman[4] = "|               |"
    drawman[5] = "|               |"

  elsif number ==  1
    drawman[3] = "|               |"
    drawman[4] = "|               |"
    drawman[5] = "|               |"

  elsif number == 2
    drawman[3] = "|       |       |"
    drawman[4] = "|               |"
    drawman[5] = "|               |"

  elsif number == 3
    drawman[3] = "|      /|       |"
    drawman[4] = "|               |"
    drawman[5] = "|               |"

  elsif number == 4
    drawman[3] = "|      /|\\      |"
    drawman[4] = "|               |"
    drawman[5] = "|               |"
  elsif number == 5
    drawman[4] = "|       |       |"
    drawman[5] = "|               |"

  elsif number == 6
    drawman[5] = "|      /        |"

  elsif number >= 7
    drawman[7] = "   You lose!!!"
  end
  puts drawman
end
#draw_man(6)

def check_letter(word, letter)
  if word.include?(letter) == false
    puts "The word does not have the letter '#{letter}' in it."
  else
    array_word = word.split("")
    locations = []
    array_word.each_with_index do |check, i|
      if check == letter
        index = array_word.index(check)
        locations.push i
      else
      end
    end
    puts locations
  end
end
#check_letter("hello", "l")

def display_result(word, guesses)
  arr = word.split("")
  @new_arr = []
  arr.each do |letter|
    if guesses.include?(letter) == false
      @new_arr.push "_"
    elsif guesses.include?(letter) == true
      @new_arr.push letter
    end
  end

end
#display_result("hello", [])
command = ""
while command != "quit"
  system("clear")
  puts "Hello! Welcome to Hangman. Here are the rules:
1. The object of the game is to guess a word by guessing letters.
2. You will be given how many characters long the word is.
3. If you guess a letter that is not in the word, a body part will be added to the hangman.
4. Once all of the body parts appear, you lose :(
5. When you are ready to guess the word, just enter it under the prompt 'guess?'.
6. If at any point you want to quit, simply type 'quit' when prompted to guess.
Your word has been randomly selected from a list of POPULAR GIRLS AND BOYS NAMES.
Ready? (enter to begin)"
  ready = gets.chomp

# go into the file and select a word
  f = File.new("words.txt")
  word_arr = f.readlines
  word_ = word_arr.sample.chomp
  f.close
# define already guessed letters
  guessed = []
#
  final_answer = ""
#
  alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j","k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  original_alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j","k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
# create variables to store
  wrongs = 0
#
  guessed = []
# output to the user
  while final_answer.downcase != word_
    system("clear")
    draw_man(wrongs)

    output_guessed = guessed.join(", ")
    output_alphabet = alphabet.join(", ")
    puts "Letters to be guessed: #{output_alphabet}"
    puts "Letters already guessed: #{output_guessed}"
    puts "
Word:
"
    display_output = display_result(word_, guessed)
    if @new_arr.join("") != word_
      puts @new_arr.join(" ")
    else
      puts @new_arr.join(" ")
      puts "You guessed the word!!! If you want to play again, type 'again', if you want to quit, type 'quit'"
      answer = gets.chomp
      if answer == "again"
        break
      elsif answer == "quit"
        exit
      else
        puts "That is not a choice. Please try again by typing 'again' or 'quit'."
        answer = gets.chomp
      end
    end

    if final_answer == word_ || @new_arr.join("") == word_
      puts "#{word_.capitalize} is correct!! You win!!! "
      puts "Want to play again? Type 'again' or 'quit.'"
      command = gets.chomp
      if command == "again"
        break
        break
      elsif command == "quit"
        puts "Thanks for playing."
        exit
      end
    end

    #puts display_output
    correct_guess = 0
    puts "
Guess?"
    final_answer = gets.chomp
    correct_guess += 1

    while guessed.include?(final_answer) == true
      puts "You already guessed that letter. Try again."
      sleep(1.75)
      final_answer = gets.chomp
    end
    guessed.push final_answer unless guessed.include?(final_answer) == true || alphabet.include?(final_answer) == false
    if original_alphabet.include?(final_answer) == false && final_answer != word_ && final_answer != "quit"
      puts "That is not a valid letter or your guess is incorrect. Press enter to try again."
      sleep(1)
      final_answer = gets.chomp
    end
    alphabet.delete(final_answer)
    if word_.include?(final_answer) == false
      wrongs += 1
    else
    end

    if wrongs == 7
      system("clear")
      draw_man(7)
      puts "GAME OVER. THE WORD WAS '#{word_}'. If you want to play again, type 'again'. If not, type 'quit'"
      command = gets.chomp
      break
    end


  end
end


























