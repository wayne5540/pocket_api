lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pocket_api/version'

Gem::Specification.new do |spec|
  spec.name = 'pocket_api'
  spec.version = PocketAPI::VERSION
  spec.required_ruby_version = '>= 2.0.0'
  spec.summary = 'Simple wrapper for the Pocket API'
  spec.description = 'Non Officialy, check https://getpocket.com/developer/ for more information'
  spec.authors = ['Wayne Chu']
  spec.email = 'wayne.5540@gmail.com'
  spec.homepage = 'https://github.com/wayne5540/pocket-api'
  spec.license = 'MIT'
  spec.files = %w(README.md pocket_api.gemspec)
  spec.files += Dir.glob("lib/**/*.rb")
  spec.require_paths = ['lib']
end