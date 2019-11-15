require_relative 'computer_player.rb'
require_relative 'human_player.rb'

puts "Hangman initialized!"

class Game

  def initialize
    @word_guesser = WordGuesser.new
    @word_creator = WordCreator.new
    @turn_number = 0
    @word_display = "_" * (@word_creator.chosen_word).size
    p @secret_word = @word_creator.chosen_word
    p @word_display
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
      p @word_display
    else
      puts "Incorrect guess"
      p @word_display
    end
  end

  def turn
    while true
      @word_guesser.make_guess
    end
  end



end #end class

game = Game.new
game.guess_feedback
#game.turn

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