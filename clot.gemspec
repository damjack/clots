# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "clot/version"

Gem::Specification.new do |s|
  s.name        = "clot"
  s.version     = Clot::VERSION
  s.authors     = ["Jim Gilliam", "Damiano Giacomello"]
  s.email       = ["giacomello.damiano@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Helpers for easily creating custom Liquid forms}
  #s.description = %q{TODO: Write a gem description}

	s.files         = `git ls-files -z`.split("\x0")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
	s.require_paths = ['lib']

  s.add_development_dependency "rspec"
  s.add_development_dependency "i18n"

	s.add_runtime_dependency "rake"
  s.add_runtime_dependency "liquid", ">= 3.0.1"
	s.add_runtime_dependency "tigerlily-solid", ">= 0.2.0"
end