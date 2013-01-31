# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'thor-rpc/version'

Gem::Specification.new do |gem|
  gem.name          = "thor-rpc"
  gem.version       = Thor::RPC::VERSION
  gem.authors       = ["Ruben Jenster"]
  gem.email         = ["r.jenster@drachenfels.de"]
  gem.description   = %q{Dynamic RPC endpoint generation for thor class definitions.}
  gem.summary       = %q{Dynamic RPC endpoint generation for thor class definitions.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|example|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "thor"
  gem.add_dependency "rack-rpc"
  gem.add_development_dependency "rake"
end
