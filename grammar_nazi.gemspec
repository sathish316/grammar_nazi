# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "grammar_nazi/version"

Gem::Specification.new do |s|
  s.name        = "grammar_nazi"
  s.version     = GrammarNazi::VERSION
  s.authors     = ["Sathish"]
  s.email       = ["sathish316@gmail.com"]
  s.homepage    = "http://www.github.com/sathish316/grammar_nazi"
  s.summary     = %q{Grammar Nazi is a machine learning library that detects common grammatical errors like it's vs its, let's vs lets etc}
  s.description = %q{Grammar Nazi is a machine learning library that detects common grammatical errors like it's vs its, let's vs lets etc}
  s.rubyforge_project = "grammar_nazi"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
