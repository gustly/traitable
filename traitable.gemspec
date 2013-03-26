# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'traitable/version'

Gem::Specification.new do |gem|
  gem.name          = "traitable"
  gem.version       = Traitable::VERSION
  gem.authors       = ["Ryan McGarvey, Rasheed Abdul-Aziz and Todd Mohney"]
  gem.email         = ["zephyr-eng@googlegroups.com"]
  gem.description   = %q{Traits are permissible roles for can can that are connected to specific models}
  gem.summary       = %q{Traits are permissible roles for can can that are connected to specific models}
  gem.homepage      = "https://github.com/zephyr-dev/traitable"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "method_source"
  gem.add_dependency "haml"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "rspec"
end
