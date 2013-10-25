# -*- encoding: utf-8; mode: ruby -*-
require File.expand_path('../lib/era_ja/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["tomi"]
  gem.email         = ["tomiacannondale@gmail.com"]
  gem.description   = %q{Convert to Japanese era.}
  gem.summary       = %q{Convert Date or Time instance to String of Japanese era.}
  gem.homepage      = "https://github.com/tomiacannondale/era_ja"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "era_ja"
  gem.require_paths = ["lib"]
  gem.version       = EraJa::VERSION

  gem.add_development_dependency "rake", '~> 10.1.0'
  gem.add_development_dependency 'rspec', '~> 2.14.1'
  gem.add_development_dependency "guard-rspec", '~> 4.0.3'
  gem.add_development_dependency 'rb-fsevent', '~> 0.9.3'
  gem.add_development_dependency 'terminal-notifier-guard', '~> 1.5.3'
end
