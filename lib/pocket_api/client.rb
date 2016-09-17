module PocketAPI
  class Client
    require 'pocket-ruby'

    def initialize(access_token)
      @client = Pocket.client(access_token: access_token)
    end

    def retrieve(options={})
      info = @client.retrieve(options)
      hashes = info['list'].values
      Collection.new(Item, hashes)
    end
  end
end