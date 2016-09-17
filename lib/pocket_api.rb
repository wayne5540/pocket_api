require 'pocket_api/configurable'
require 'pocket_api/item'
require 'pocket_api/collection'
require 'pocket_api/client'

module PocketAPI
  class Error < StandardError; end
  class InvalidAttributeError < Error; end

  class << self
    include PocketAPI::Configurable
  end
end