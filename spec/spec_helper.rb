require 'pocket_api'
require 'pocket-ruby'
require 'rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock

  config.filter_sensitive_data("<<POCKET_CONSUMER_KEY>>") do
    test_pocket_consumer_key
  end

  config.filter_sensitive_data("<<POCKET_ACCESS_TOKEN>>") do
    test_pocket_access_token
  end
end


def test_pocket_consumer_key
  ENV.fetch 'POCKET_API_TEST_CONSUMER_KEY', '58502-d592d808b56706effc11f6ba'
end

def test_pocket_access_token
  ENV.fetch 'POCKET_API_TEST_ACCESS_TOKEN', '6a523393-74d9-6c9d-9402-1cea5d'
end
