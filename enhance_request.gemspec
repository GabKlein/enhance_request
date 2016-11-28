# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name        = 'enhance_request'
  spec.version     = '0.0.1'
  spec.date        = '2016-11-28'
  spec.summary     = 'Enhance Request'
  spec.description = 'A simple request enhancer'
  spec.authors     = ['Gabriel Klein']
  spec.email       = 'gabriel.klein.fr@gmail.com'
  spec.files       = ['lib/enhance_request.rb']
  spec.homepage    = 'http://rubygems.org/gems/enhance_request'
  spec.license     = 'MIT'
  spec.require_paths = ['lib']

  spec.add_dependency 'user_agent_parser', '~> 2.3'
  spec.add_dependency 'browser', '~> 2.3'
  spec.add_dependency 'addressable', '~> 2.5'
end
