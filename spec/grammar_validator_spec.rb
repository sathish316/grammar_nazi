require 'spec_helper'

describe GrammarValidator do
  it "should learn from textfile" do
    File.expects(:open).with("/data/tom_sawyer.txt").returns(file = stub('file'))
    file.expects(:read).returns("chapter1-10")

    BigramCounter.any_instance.expects(:after).with("it's").returns({"raining" => 1, "sunny" => 2})
    BigramCounter.any_instance.expects(:after).with("its").returns({"color" => 4, "tail" => 6})
    
    Bigram.stubs(:first).returns(nil)
    
    Bigram.expects(:create).with(preceding_word: "it's", succeeding_word: "raining", count: 1)
    Bigram.expects(:create).with(preceding_word: "it's", succeeding_word: "sunny", count: 2)
    Bigram.expects(:create).with(preceding_word: "its", succeeding_word: "color", count: 4)
    Bigram.expects(:create).with(preceding_word: "its", succeeding_word: "tail", count: 6)
    
    validator = GrammarValidator.new
    validator.learn("/data/tom_sawyer.txt", ["its", "it's"])
  end

  it "should update record if it already exists" do
    File.expects(:open).with("/data/tom_sawyer.txt").returns(file = stub('file'))
    file.expects(:read).returns("chapter1-10")

    BigramCounter.any_instance.expects(:after).with("it's").returns({"raining" => 5})
    Bigram.expects(:first).with(preceding_word: "it's", succeeding_word: "raining").returns(bigram = Bigram.new(count: 5))
    bigram.expects(:update).with(count: 10)
    
    validator = GrammarValidator.new
    validator.learn("/data/tom_sawyer.txt", ["it's"])
  end
end
