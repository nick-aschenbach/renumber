# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'renumber/version'

Gem::Specification.new do |spec|
  spec.name          = 'renumber'
  spec.version       = Renumber::VERSION
  spec.authors       = ['Nick Aschenbach']
  spec.email         = ['nick.aschenbach@gmail.com']

  spec.summary       = %q{Simple file utility to renumber sequential files in a directory}
  spec.description   = %q{Allows renumbering non-sequential files sequentially. For example f00.txt, f03.txt, f99.txt -> f0.txt, f1.txt, f2.txt. Usage: renumber directory_name [prefix] [suffix]}
  spec.homepage      = 'https://github.com/nick-aschenbach/renumber'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']


  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
