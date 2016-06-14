require 'rails_helper'

RSpec.describe Store, type: :model do
  it "can search all by zip" do
    VCR.use_cassette "model_store_can_get_all_in_zip" do
      output = Store.find_all_by_zip("80202")

      expect(output[:stores].count).to eq(15)
      expect(output[:total]).to eq(17)
      expect(output[:stores].first.long_name).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
      expect(output[:stores].first.city).to eq("Denver")
      expect(output[:stores].first.distance).to eq(3.25)
      expect(output[:stores].first.phone).to eq("303-270-9189")
      expect(output[:stores].first.store_type).to eq("Mobile")
    end
  end
end
