require_relative 'computer_player.rb'
require_relative 'human_player.rb'

puts "Hangman initialized!"

class Game
  attr_accessor :dictionary

  def initialize
    @word_guessor = WordGuesser.new
    @word_creator = WordCreator.new

  end

end #end class

game = Game.new

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