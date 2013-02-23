# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blank_slate/version'

Gem::Specification.new do |gem|
  gem.name          = "blank_slate"
  gem.version       = BlankSlate::VERSION
  gem.authors       = ["'Jim Gay'"]
  gem.email         = ["jim@saturnflyer.com"]
  gem.description   = %q{
    Create null classes based upon other classes.
    This allows you to create null objects without resorting to
    method_missing to catch every message passed regardless of
    the behavior you designed in your other classes.}
  gem.summary       = %q{Impliment a null object without resorting to method_missing.}
  gem.homepage      = "http://github.com/saturnflyer/blank_slate"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
