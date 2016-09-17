RSpec.describe PocketAPI::Client do
  before do
    PocketAPI.configure do |config|
      config.consumer_key = test_pocket_consumer_key
    end
  end

  describe '#retrieve' do
    subject { described_class.new(test_pocket_access_token).retrieve(options) }
    let(:options) { {} }

    context 'when success' do
      around do |example|
        VCR.use_cassette(:success_retrieve) do
          example.call
        end
      end

      it 'returns collection with items' do
        expect(subject).to be_a(PocketAPI::Collection)
        expect(subject.data.all? { |o| o.is_a?(PocketAPI::Item) }).to be true
      end
    end

    context 'when consumer_key invalid' do
      around do |example|
        VCR.use_cassette(:consumer_key_invalid) do
          example.call
        end
      end

      it 'raises Faraday::ClientError' do
        expect { subject }.to raise_error(Faraday::ClientError)
      end
    end

    context 'when access_token invalid' do
      around do |example|
        VCR.use_cassette(:access_token_invalid) do
          example.call
        end
      end

      it 'raises Pocket::Error' do
        expect { subject }.to raise_error(Pocket::Error)
      end
    end
  end
end