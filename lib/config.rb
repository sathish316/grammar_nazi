require 'rubygems'
require 'data_mapper'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite:///#{Dir.pwd}/data/words.db")

require 'bigram_counter'
require 'bigram'

DataMapper.finalize
DataMapper.auto_upgrade!