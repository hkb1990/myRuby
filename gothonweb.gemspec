# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gothonweb/version'

Gem::Specification.new do |gem|
  gem.name          = "myRuby"
  gem.version       = Gothonweb::VERSION
  gem.authors       = ["HKB"]
  gem.email         = ["hkb1990@gmail.com"]
  gem.description   = %q{my first gothonweb}
  gem.summary       = %q{my summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
