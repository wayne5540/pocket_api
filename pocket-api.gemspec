lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pocket_api/version'

Gem::Specification.new do |spec|
  spec.add_dependency 'pocket-ruby', '~> 0.0.6'

  spec.name = 'pocket-api'
  spec.version = PocketAPI::VERSION
  spec.required_ruby_version = '>= 2.0.0'
  spec.summary = 'Simple wrapper for the Pocket API'
  spec.description = 'Simple wrapper for the Pocket API (Non-officially)'
  spec.authors = ['Wayne Chu']
  spec.email = 'wayne.5540@gmail.com'
  spec.homepage = 'https://github.com/wayne5540/pocket_api'
  spec.license = 'MIT'
  spec.files = %w(README.md LICENSE.md pocket-api.gemspec)
  spec.files += Dir.glob("lib/**/*.rb")
  spec.require_paths = ['lib']
end