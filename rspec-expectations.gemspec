# -*- encoding: utf-8 -*-
require "rspec/expectations/version"

require "rspec/core/version"
require "rspec/mocks/version"

Gem::Specification.new do |s|
  s.name        = "rspec-expectations"
  s.version     = RSpec::Expectations::Version::STRING
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Chelimsky", "Chad Humphries"]
  s.email       = "dchelimsky@gmail.com;chad.humphries@gmail.com"
  s.homepage    = "http://github.com/rspec/rspec-expectations"
  s.summary     = "rspec-expectations-#{RSpec::Expectations::Version::STRING}"
  s.description = "rspec expectations (should[_not] and matchers)"

  s.rubygems_version   = "1.3.7"
  s.rubyforge_project  = "rspec"

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.extra_rdoc_files = [ "README.markdown" ]
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"

  s.add_runtime_dependency     'diff-lcs',           '>= 1.1.2'

  s.add_development_dependency "rspec-core",         ">= #{RSpec::Core::Version::STRING}"
  s.add_development_dependency "rspec-mocks",        ">= #{RSpec::Mocks::Version::STRING}"
  s.add_development_dependency "rake",               ">= 0.8.7"
  s.add_development_dependency "cucumber",           ">= 0.9.1"
  s.add_development_dependency "aruba",              ">= 0.2.3"
  s.add_development_dependency "watchr",             ">= 0.7"
  s.add_development_dependency "autotest",           ">= 4.4.1"
end

