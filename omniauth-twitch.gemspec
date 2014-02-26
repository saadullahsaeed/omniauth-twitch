# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-twitch/version'

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth-oauth2', '~> 1.1'
  
  gem.authors     = ["Bernhard Schwarz"]
  gem.email       = ["bschwrz@gmail.com"]
  gem.homepage    = "https://github.com/adabei/omniauth-twitch"
  gem.summary     = %q{OmniAuth strategy for Twitch.}
  gem.description = gem.summary
  gem.license     = 'MIT'

  gem.executables   = `git ls-files -- bin/*`.split("\n").collect { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.version       = OmniAuth::Twitch::VERSION
  gem.require_paths  = ['lib']
  gem.name          = "omniauth-twitch"
end
