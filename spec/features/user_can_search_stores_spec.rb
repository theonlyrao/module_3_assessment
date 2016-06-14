require 'rails_helper'

RSpec.feature "UserCanSearchStores", type: :feature do
  describe "user exists" do
    it "can search for stores" do
      VCR.use_cassette "feature_user_can_search_stores" do
# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)

# And I should see a message that says "17 Total Stores"

        visit root_path
        within ".search-box" do
          fill_in "Zip", with: "80202"
          click_on "Search"
        end

        expect(current_path).to eq(search_path)
        # And I should see stores within 25 miles of 80202
        expect(page).to have_content("17 Total Stores")
        # And I should see exactly 15 results
        # And I should see the long name, city, distance, phone number and store type for each of the 15 results        
        # The name will be a link in the next story:

        within ".store-1" do
          expect(page).to have_link("Best Buy Mobile - Cherry Creek Shopping Center")
          expect(page).to have_content("Denver")
          expect(page).to have_content("3.25")
          expect(page).to have_content("303-270-9189")
          expect(page).to have_content("Mobile")
        end

      end
    end
  end
end
