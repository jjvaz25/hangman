require_relative 'computer_player.rb'
require_relative 'human_player.rb'

puts "Hangman initialized!\n\n"

class Game

  def initialize
    @word_guesser = WordGuesser.new
    @word_creator = WordCreator.new
    @incorrect_guesses_left = 6
    @word_display = "_" * (@word_creator.chosen_word).size
    @incorrect_characters = []
    p @secret_word = @word_creator.chosen_word
    @word_display
  end

  def guess_feedback
    guess = @word_guesser.make_guess
    if @secret_word.include?(guess)
      puts "Correct guess!"
      @secret_word.each_char.with_index do |char, index|
        if char == guess
          @word_display[index] = guess
        end
      end
      #p @word_display
    else
      puts "Incorrect guess"
      #p @word_display
      @incorrect_characters.push(guess)
      @incorrect_guesses_left -= 1
    end
  end

  def turn
    while !game_over?
      puts "Guess the following word: #{@word_display}"
      puts "Incorrect guesses left: #{@incorrect_guesses_left}"
      puts "Incorrect characters: #{@incorrect_characters}"
      guess_feedback
    end
  end

  def game_over?
    if !@word_display.include?("_") #if the word display doesn't include a _
      puts "Game over! You win!"
      puts "You correctly guessed #{@word_display}"
      return true
    elsif @incorrect_guesses_left < 0
      puts "Game over. You failed to guess the following word in time:"
      puts @secret_word
      return true
    else
      return false
    end
  end

end #end class

game = Game.new
game.turn

=begin
Logic:
-start game
-computer randomly selects a word between 5-12 characters from dictionary
-human guesses letters in a word
---human has option to guess a letter or entire word
-human has 6 guesses to guess the word
-update display
-if human guesses word correctly, they win

-once this is done add saving logic

=end 