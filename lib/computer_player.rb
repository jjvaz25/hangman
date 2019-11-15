class WordCreator

  attr_reader :chosen_word, :word_display
  def initialize
    @valid_words = []
    @list_of_words = File.readlines("5desk.txt").each do |line|
      if line.length > 6 && line.length < 15
        2.times { line.slice!(-1) }
        @valid_words.push(line.downcase)
      end
    end
    @chosen_word = @valid_words[rand(52453)] #@valid_words.size == 52453
  end

end
