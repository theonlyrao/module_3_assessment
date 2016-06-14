require 'rails_helper'

RSpec.describe Store, type: :model do
  it "can search all by zip" do
    VCR.use_cassette "model_store_can_get_all_in_zip" do
      stores = Store.find_all_by_zip("80202")

      expect(stores.count).to eq(15)
      expect(stores.first.name).to eq("a name")
      expect(stores.first.city).to eq("a city")
      expect(stores.first.distance).to eq("a distance")
      expect(stores.first.distance).to eq("a phone")
      expect(stores.first.disatnce).to eq("a type")
    end
  end
end
