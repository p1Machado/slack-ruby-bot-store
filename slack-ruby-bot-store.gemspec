# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slack-ruby-bot-store/version'

Gem::Specification.new do |spec|
  spec.name          = 'slack-ruby-bot-store'
  spec.version       = SlackRubyBotStore::VERSION
  spec.authors       = ['Patrick Machado']
  spec.email         = ['paamachado.93@gmail.com']

  spec.summary       = 'A set of models that give a team storage for slack-ruby-bot-server. Extracted from slack-ruby/slack-ruby-bot-server.'
  spec.homepage      = 'https://github.com/p1Machado/slack-ruby-bot-store'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.require_paths = ['lib']
end
