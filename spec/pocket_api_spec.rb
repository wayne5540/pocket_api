RSpec.describe PocketAPI do
  describe '.configure' do
    it 'sets the consumer_key' do
      PocketAPI.configure do |config|
        config.consumer_key = 'consumer-key'
      end

      expect(PocketAPI.consumer_key).to eq('consumer-key')
      expect(Pocket.options[:consumer_key]).to eq('consumer-key')
    end
  end
end