# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'printful/version'

Gem::Specification.new do |spec|
  spec.name          = "printful"
  spec.version       = Printful::VERSION
  spec.authors       = ["Ryan Krug"]
  spec.email         = ["ryan@elbongurk.com"]
  spec.description   = "Ruby library for integrating with the Printful API"
  spec.summary       = "Printful API Ruby Client Library"
  spec.homepage      = "https://github.com/elbongurk/printful"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
