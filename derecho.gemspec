# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'derecho/version'

Gem::Specification.new do |spec|
  spec.name          = "derecho"
  spec.version       = Derecho::VERSION
  spec.authors       = ["Ross Waguespack"]
  spec.email         = ["rosswaguespack@gmail.com"]

  spec.summary       = %q{wunderground weather api gem}
  spec.description   = %q{Weather gem that pulls weather data from Wunderground API}
  spec.homepage      = "https://github.com/monster52/derecho"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_runtime_dependency     "httparty"
end
