require 'config'

class GrammarValidator

  def learn(file, preceding_words)
    text = File.open(file).read
    bigram_counter = BigramCounter.new(text)
    preceding_words.each do |preceding_word|
      succeeding_words = bigram_counter.after(preceding_word)
      succeeding_words.each do |succeeding_word, count|
        bigram = Bigram.first(preceding_word: preceding_word, succeeding_word: succeeding_word)
        if bigram
          bigram.update(count: count + bigram.count)
        else
          Bigram.create(preceding_word: preceding_word, succeeding_word: succeeding_word, count: count)
        end
      end
    end
  end
  
  def validate(sentence)
    validate_usage_of("its", "it's", sentence)
  end
  
  def validate_usage_of(selected_word, alternate_word, sentence)
    words = sentence.split
    i = 0
    words.each_cons(2) do |preceding_word, succeeding_word|
      if selected_word == preceding_word || alternate_word == preceding_word
        if adjacency_probability(selected_word, succeeding_word) < adjacency_probability(alternate_word, succeeding_word)
          words[i] = alternate_word
        end
      end
      i += 1
    end
    words.join(' ')
  end
  
  private
  
  def adjacency_probability(preceding_word, succeeding_word)
    bigram = Bigram.first(preceding_word: preceding_word, succeeding_word: succeeding_word)
    bigram ? bigram.count : 0
  end
end