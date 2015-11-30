# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/salesloft/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-salesloft"
  spec.version       = Omniauth::Salesloft::VERSION
  spec.authors       = ["Mike Sandt"]
  spec.email         = ["michael.sandt@gmail.com"]
  spec.summary       = %q{OmniAuth strategy for SalesLoft}
  spec.description   = %q{OmniAuth strategy for SalesLoft}
  spec.homepage      = "https://github.com/salesloft/omniauth-salesloft"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth", "~>1.0"
  spec.add_dependency "omniauth-oauth2", "~>1.0"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rspec", "~>3.2.0"
  spec.add_development_dependency "rake"
end
