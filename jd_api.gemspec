# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jd_api/version'

Gem::Specification.new do |spec|
  spec.name          = "jd_api"
  spec.version       = JdApi::VERSION
  spec.authors       = ["cedric"]
  spec.email         = ["cedric_chenzhong@163.com"]
  spec.description   = %q{ get goods info from jd }
  spec.summary       = %q{ get goods info from jd just with url }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"


end
