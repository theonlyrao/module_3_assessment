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
end
