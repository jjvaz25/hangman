require_relative 'computer_player.rb'
require_relative 'human_player.rb'
require 'yaml'

puts "Hangman initialized!\n\n"

class Game

  def initialize
    @word_guesser = WordGuesser.new
    @word_creator = WordCreator.new
    @incorrect_guesses_left = 6
    @word_display = "_" * (@word_creator.chosen_word).size
    @incorrect_characters = []
    @secret_word = @word_creator.chosen_word
    #p @secret_word
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
    else
      puts "Incorrect guess"
      @incorrect_characters.push(guess)
      @incorrect_guesses_left -= 1
    end
  end

  def play
    load_game_from_yaml
    while !game_over?
      puts "Guess the following word: #{@word_display}"
      puts "Incorrect guesses left: #{@incorrect_guesses_left}"
      puts "Incorrect characters: #{@incorrect_characters}"
      guess_feedback
      puts "Save game?"
      answ = gets.chomp
      if answ.downcase == "y"
        save_game_to_yaml
      end
      
    end
  end

  def game_over?
    if !@word_display.include?("_")
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

  def save_game_to_yaml
    puts "Type your game save name"
    file_name = gets.chomp + ".yml"

    hash = {
      :word_guessor => @word_guesser,
      :worc_creator => @word_creator,
      :incorrect_guesses_left => @incorrect_guesses_left,
      :word_display => @word_display,
      :incorrect_characters => @incorrect_characters,
      :secret_word => @secret_word
    }
    dump = YAML::dump(hash)
    File.open(file_name, "w") { |file| file.write(dump) }
  end

  def load_game_from_yaml
    puts "Would you like to load a previous game page('Y' or 'N')?"
    load_game = gets.chomp.downcase
    if load_game.downcase == "y"
      puts "Type in game save name"
      save_name = gets.chomp + ".yml"
      game_to_load = File.read(save_name)
      game = YAML.load(game_to_load)

      @word_guesser = game[:word_guessor]
      @word_creator = game[:word_creator]
      @incorrect_guesses_left = game[:incorrect_guesses_left]
      @word_display = game[:word_display]
      @incorrect_characters = game[:incorrect_characters]
      @secret_word = game[:secret_word]
    end
  end


end #end class

game = Game.new
#game.save_game_to_yaml
game.play

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