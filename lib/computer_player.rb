class WordCreator
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
end
