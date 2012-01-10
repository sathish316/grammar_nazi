class Bigram
  include DataMapper::Resource
  
  property :id, Serial
  property :preceding_word, String
  property :succeeding_word, String
  property :count, Integer
end