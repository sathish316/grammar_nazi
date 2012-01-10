require 'spec_helper'

describe BigramCounter do
  it "should count words after given word" do
    counter = BigramCounter.new <<-TEXT
      The quick brown fox jumped over the lazy dog before the lazy lion could eat it
TEXT
    counter.after('the').should == {'quick' => 1, 'lazy' => 2}
  end

  it "should truncate punctuation characters" do
    counter = BigramCounter.new <<-TEXT
      The quick brown fox jumped over the dog.
TEXT
    counter.after('the').should == {'quick' => 1, 'dog' => 1}
  end
end