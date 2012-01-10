require 'config'

class GrammarValidator

  def learn(file, preceding_words)
    text = File.open(file).read
    bigram_counter = BigramCounter.new(text)
    preceding_words.each do |preceding_word|
      succeeding_words = bigram_counter.after(preceding_word)
      succeeding_words.each do |succeeding_word, count|
        Bigram.create(preceding_word: preceding_word, succeeding_word: succeeding_word, count: count)
      end
    end
  end
end