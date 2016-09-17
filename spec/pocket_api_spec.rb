RSpec.describe PocketAPI do
  describe '.say' do
    specify do
      expect(described_class.say).to eq("Heeeeelo World")
    end
  end

  describe '.configure' do
    it 'sets the consumer_key' do
      PocketAPI.configure do |config|
        config.consumer_key = 'consumer-key'
      end

      expect(PocketAPI.consumer_key).to eq('consumer-key')
    end
  end
end