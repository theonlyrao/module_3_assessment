require 'rails_helper'

RSpec.feature "DisplaysItems", type: :feature do
  it "properly cleans the database" do
    expect(Item.count).to eq(0)
    item_one = create(:item)
    item_two = create(:item)
    expect(Item.count).to eq(2)
  end
  it "can reach the root page" do
    expect(Item.count).to eq(0)
    visit root_path

    within ("h1") do
      expect(page).to have_content("Items")
    end
  end

  it "uses vcr properly" do
    VCR.use_cassette("VCR_test") do
      connection = Faraday.new('http://congress.api.sunlightfoundation.com')
      connection.params[:apikey] = ENV['SUNLIGHT_KEY']
      response = connection.get("legislators", { :gender => "F" })
      parsed = JSON.parse(response.body, symbolize_names: true)
      results = parsed[:results]

      expect(results.count).to eq(20)
      expect(results.first[:first_name]).to eq("Joni")
    end
  end

  it "isn't messed up by webmock" do
    VCR.use_cassette("VCR_test_2") do
      connection = Faraday.new('http://congress.api.sunlightfoundation.com')
      connection.params[:apikey] = ENV['SUNLIGHT_KEY']
      response = connection.get("legislators", { :gender => "M" })
      parsed = JSON.parse(response.body, symbolize_names: true)
      results = parsed[:results]

      expect(results.first[:first_name]).to eq("Darin")
    end

  end
end
