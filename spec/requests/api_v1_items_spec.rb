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
      expect(first_item["created_at"]).to be_nil
      expect(first_item["updated_at"]).to be_nil
    end
  end

  describe "GET /api/v1/items/1" do
    it "sends back only requested item" do
      #When I send a GET request to /api/v1/items/1 I receive a 200 JSON response containing the name, description, and image_url but not the created_at or updated_at
      10.times do |n|
        create(:item)
      end

      target = Item.find(1)

      get "/api/v1/items/1"
      item = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(item["name"]).to eq(target.name)
      expect(item["description"]).to eq(target.description)
      expect(item["image_url"]).to eq (target.image_url)
      expect(item["created_at"]).to be_nil
      expect(item["updated_at"]).to be_nil
    end
  end

  describe "DELETE /api/v1/items/1" do
#When I send a DELETE request to /api/v1/items/1 I receive a 204 JSON response if the record is successfully deleted
    it "deletes specified item" do
  
      10.times do |n|
        create(:item)
      end

      target = Item.find(1)

      delete "/api/v1/items/1"
      expect(response).to have_http_status(204)
      expect(response.body).to eq("")
    end
  end

end
