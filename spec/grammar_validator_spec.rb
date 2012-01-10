require 'spec_helper'

describe GrammarValidator do
  it "should learn from textfile" do
    File.expects(:open).with("/data/tom_sawyer.txt").returns(file = stub('file'))
    file.expects(:read).returns("chapter1-10")

    BigramCounter.any_instance.expects(:after).with("it's").returns({"raining" => 1, "sunny" => 2})
    BigramCounter.any_instance.expects(:after).with("its").returns({"color" => 4, "tail" => 6})
    
    Bigram.expects(:create).with(preceding_word: "it's", succeeding_word: "raining", count: 1)
    Bigram.expects(:create).with(preceding_word: "it's", succeeding_word: "sunny", count: 2)
    Bigram.expects(:create).with(preceding_word: "its", succeeding_word: "color", count: 4)
    Bigram.expects(:create).with(preceding_word: "its", succeeding_word: "tail", count: 6)
    
    validator = GrammarValidator.new
    validator.learn("/data/tom_sawyer.txt", ["its", "it's"])
  end
end
