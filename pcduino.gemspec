# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pcduino/version'

Gem::Specification.new do |spec|
  spec.name          = "pcduino"
  spec.version       = Pcduino::VERSION
  spec.authors       = "Will Olner"
  spec.email         = "William.olner@gmail.com"
  spec.description   = "Control GPIO of Pcduino"
  spec.summary       = "Control GPIO of Pcduino"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
