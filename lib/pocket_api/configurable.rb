module PocketAPI
  module Configurable
    attr_accessor :consumer_key

    def configure
      yield self
      Pocket.configure { |config| yield config }
    end
  end
end