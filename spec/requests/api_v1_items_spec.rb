require 'rails_helper'

RSpec.describe "ApiV1Items", type: :request do
  describe "GET /api_v1_items" do
    it "sends back all items" do
      #When I send a GET request # to /api/v1/items I receive a 200 JSON response containing all items And each item has a name, description, and image_url but not the created_at or updated_at
      target = create(:item)
      
      10.times do |n|
        create(:item)
      end
      
      get "/api/v1/items"
      item_count = Item.count

      items = JSON.parse(response.body)
      first_item = items.first
      expect(response).to have_http_status(200)
      expect(items.length).to eq(item_count)
      expect(first_item["name"]).to eq(target.name)
      expect(first_item["description"]).to eq(target.description)
      expect(first_item["image_url"]).to eq (target.image_url)
      expect(first_item["image
  end
end
