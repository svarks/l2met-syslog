# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'l2met/syslog/version'

Gem::Specification.new do |spec|
  spec.name          = "l2met-syslog"
  spec.version       = L2met::Syslog::VERSION
  spec.authors       = ["Sergey Varaksin"]
  spec.email         = ["varaksin86@gmail.com"]
  spec.description   = %q{l2m compatible logger}
  spec.summary       = %q{allows to log system monitoring information asyncronously}
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
