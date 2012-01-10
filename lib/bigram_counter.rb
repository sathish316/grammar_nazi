class BigramCounter
  def initialize(text)
    @text = text.downcase!
  end
  
  def after(word)
    counts = {}
    @text.split.each_cons(2) do |preceding_word, succeeding_word|
      if word == preceding_word
        succeeding_word.gsub!(/[.,!]/,'')
        counts[succeeding_word] ||= 0
        counts[succeeding_word] += 1
      end
    end
    counts
  end
end