RSpec.describe PocketAPI do
  describe '.say' do
    specify do
      expect(described_class.say).to eq("Heeeeelo World")
    end
  end
end