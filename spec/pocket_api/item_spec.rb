RSpec.describe PocketAPI::Item do
  describe '.new' do
    subject(:item) { described_class.new(item_hash) }

    let(:item_hash) {
      {
        "item_id" => "1402292299",
        "resolved_id" => "1400154976",
        "given_url" => "",
        "given_title" => "",
        "favorite" => "0",
        "status" => "0",
        "time_added" => "1472961477",
        "time_updated" => "1472961493",
        "time_read" => "0",
        "time_favorited" => "0",
        "sort_id" => 0,
        "resolved_title" => "Tricks to Monetize your Side Projects",
        "resolved_url" => "http://jeremyaboyd.com/tricks-to-monetize-your-side-projects/",
        "excerpt" => "I was recently commenting on an excellent Show HN for a product called Duet and it was the most karma I have ever received on Hacker News (17 votes in 4 hours), and another respondent said I should write it up as a blog post. So here it is.",
        "is_article" => "1",
        "is_index" => "0",
        "has_video" => "0",
        "has_image" => "0",
        "word_count" => "917"
      }
    }

    it 'defined methods' do
      expect(item.id).to eq(item.item_id)
      expect(item.item_id).to eq(item_hash["item_id"])
      expect(item.resolved_id).to eq(item_hash["resolved_id"])
      expect(item.given_url).to eq(item_hash["given_url"])
      expect(item.given_title).to eq(item_hash["given_title"])
      expect(item.favorite).to eq(item_hash["favorite"].to_i)
      expect(item.status).to eq(item_hash["status"].to_i)
      expect(item.time_added).to eq(Time.at(item_hash["time_added"].to_i))
      expect(item.time_updated).to eq(Time.at(item_hash["time_updated"].to_i))
      expect(item.time_read).to eq(nil)
      expect(item.time_favorited).to eq(nil)
      expect(item.sort_id).to eq(item_hash["sort_id"])
      expect(item.resolved_title).to eq(item_hash["resolved_title"])
      expect(item.resolved_url).to eq(item_hash["resolved_url"])
      expect(item.excerpt).to eq(item_hash["excerpt"])
      expect(item.is_article).to be true
      expect(item.is_index).to be false
      expect(item.has_video).to eq(0)
      expect(item.has_image).to eq(0)
      expect(item.word_count).to eq(item_hash["word_count"].to_i)
    end
  end
end
