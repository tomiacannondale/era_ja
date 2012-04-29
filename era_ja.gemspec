# -*- encoding: utf-8; mode: ruby -*-
require File.expand_path('../lib/era_ja/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["tomi"]
  gem.email         = ["tomiacannondale@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "era_ja"
  gem.require_paths = ["lib"]
  gem.version       = EraJa::VERSION
end
