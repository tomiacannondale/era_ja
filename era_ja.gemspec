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
  gem.license       = "MIT"

  gem.add_development_dependency "rake", '~> 10.1.0'
  gem.add_development_dependency 'rspec', '~> 3.1.0'
  gem.add_development_dependency "guard-rspec", '~> 4.5.0'
  gem.add_development_dependency 'rb-fsevent', '~> 0.9.4'
  gem.add_development_dependency 'terminal-notifier-guard', '~> 1.6.4'
  gem.add_development_dependency 'yard', '~> 0.9.12'
end
