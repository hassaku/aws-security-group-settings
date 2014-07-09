# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aws/version'

Gem::Specification.new do |spec|
  spec.name          = "aws-security-group-settings"
  spec.version       = Aws::VERSION
  spec.authors       = ["hassaku"]
  spec.email         = ["hassaku@gmail.com"]
  spec.description   = %q{Easily configure aws security groups with yaml}
  spec.summary       = %q{Just run after preparing yaml files to configure security groups.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
