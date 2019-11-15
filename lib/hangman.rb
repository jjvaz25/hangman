require_relative 'computer_player.rb'
require_relative 'human_player.rb'

puts "Hangman initialized!"

class Game
  attr_accessor :dictionary

  def initialize
    @valid_words = []
    @list_of_words = File.readlines("5desk.txt").each do |line|
      if line.length > 6 && line.length < 15
        2.times { line.slice!(-1) }
        @valid_words.push(line)
      end
    end
    @secret_word = @valid_words[rand(52453)] #@valid_words.size == 52453
    p @secret_word
    p @word_display = "_" * (@secret_word.size)
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