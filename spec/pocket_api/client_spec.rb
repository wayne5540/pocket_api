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
      context 'when items exist' do
        around do |example|
          VCR.use_cassette('retrieve/simple_success') do
            example.call
          end
        end

        it 'returns collection with items' do
          expect(subject).to be_a(PocketAPI::Collection)
          expect(subject.data.all? { |o| o.is_a?(PocketAPI::Item) }).to be true
        end
      end

      context 'when items is empty' do
        let(:options) { {since: Time.now.to_i} }
        around do |example|
          VCR.use_cassette('retrieve/simple_success_empty_items') do
            example.call
          end
        end

        it 'returns collection with items' do
          expect(subject).to be_a(PocketAPI::Collection)
          expect(subject.data.all? { |o| o.is_a?(PocketAPI::Item) }).to be true
          expect(subject.data.count).to eq(0)
        end
      end
    end

    context 'when consumer_key invalid' do
      around do |example|
        VCR.use_cassette('retrieve/consumer_key_invalid') do
          example.call
        end
      end

      it 'raises Faraday::ClientError' do
        expect { subject }.to raise_error(Faraday::ClientError)
      end
    end

    context 'when access_token invalid' do
      around do |example|
        VCR.use_cassette('retrieve/access_token_invalid') do
          example.call
        end
      end

      it 'raises Pocket::Error' do
        expect { subject }.to raise_error(Pocket::Error)
      end
    end
  end
end