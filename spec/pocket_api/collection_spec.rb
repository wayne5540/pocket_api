RSpec.describe PocketAPI::Collection do
  let(:klass) { PocketAPI::Item }
  let(:hashes) do
    [{
      "item_id" => "1402292299",
      "resolved_id" => "1400154977",
      "given_url" => "",
      "given_title" => "",
      "favorite" => "0",
      "status" => "0",
      "time_added" => "1472961477",
      "time_updated" => "1472961493",
      "time_read" => "0",
      "time_favorited" => "0",
      "sort_id" => 0,
      "resolved_title" => "Example Title",
      "resolved_url" => "http://example.com",
      "excerpt" => "exmaple",
      "is_article" => "1",
      "is_index" => "0",
      "has_video" => "0",
      "has_image" => "0",
      "word_count" => "917"
    },
    {
      "item_id" => "1402292300",
      "resolved_id" => "1400154977",
      "given_url" => "",
      "given_title" => "",
      "favorite" => "0",
      "status" => "0",
      "time_added" => "1472961477",
      "time_updated" => "1472961493",
      "time_read" => "0",
      "time_favorited" => "0",
      "sort_id" => 0,
      "resolved_title" => "Example Title 2",
      "resolved_url" => "http://example2.com",
      "excerpt" => "exmaple 2",
      "is_article" => "1",
      "is_index" => "0",
      "has_video" => "0",
      "has_image" => "0",
      "word_count" => "1000"
    }]
  end


  describe '.new' do
    subject(:collection) { described_class.new(klass, hashes) }

    context 'when klass is PocketAPI::Item' do
      it 'sets data' do
        expect(collection).to be_a(PocketAPI::Collection)
        expect(collection.data).to be_kind_of(Enumerable)
        expect(collection.data.count).to eq(hashes.count)
        expect(collection.data.all? {|o| o.class == PocketAPI::Item } ).to be true
      end
    end
  end

  describe '#where' do
    let(:collection) { described_class.new(klass, hashes) }
    subject { collection.where(key => value) }

    context 'when passing nothing' do
      it 'raise ArgumentError' do
        expect { collection.where }.to raise_error(ArgumentError)
      end
    end

    context 'when key is not exist' do
      let(:key) { :invalidkey }
      let(:value) { "value" }

      it 'raise InvalidAttributeError' do
        expect { subject }.to raise_error(PocketAPI::InvalidAttributeError)
      end
    end

    context 'when key is valid' do
      let(:key) { :item_id }

      context 'when record found' do
        let(:value) { hashes.first['item_id'] }

        it 'returns collection with record' do
          expect(subject).to be_a(PocketAPI::Collection)
          expect(subject.count).to eq(1)
        end
      end

      context 'when record not found' do
        let(:value) { 'no-this-item' }

        it 'returns collection with empty data' do
          expect(subject).to be_a(PocketAPI::Collection)
          expect(subject.count).to eq(0)
        end
      end
      
    end
  end
end
