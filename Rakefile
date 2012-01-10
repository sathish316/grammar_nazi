require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'grammar_validator'

RSpec::Core::RakeTask.new('spec')

task :default => :spec

desc "Train using file"
task "grammar:learn", :file do |task, args|
  puts "Reading file: #{args[:file]}"
  validator = GrammarValidator.new
  validator.learn(args[:file], ["its", "it's"])
end

desc "Validate sentence from known grammatical rules"
task "grammar:validate", :sentence do |task, args|
  validator = GrammarValidator.new
  puts validator.validate(args[:sentence])
end
