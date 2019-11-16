class WordGuesser

  def initialize
  end

  def make_guess
    character = ""
    puts "\n\nWhat letter would you like to guess?"
    guess = gets.chomp.downcase
    if valid_guess?(guess)
      guess
    else
      valid_input = false
      while valid_input != true
        puts "Invalid input. Enter any character a-z"
        guess = gets.chomp.downcase
        valid_guess?(guess)? valid_input = true : valid_input = false
      end
      guess
    end
  end

  def valid_guess?(character)
    character.size == 1 && character.match(/[a-z]/)? true : false
  end
end
