require 'rails_helper'

RSpec.feature "UserCanSearchStores", type: :feature do
  scenario "user exists" do
    it "can search for stores" do
      VCR.use_casette "feature_user_can_search_stores" do
# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 15 results
# And I should see the long name, city, distance, phone number and store type for each of the 15 results

# The name will be a link in the next story:

        visit root_path
        within ".search-box" do
          fill_in "Zip", with: "80202"
          click_on "Search"
        end

        expect
        
      end
    end
  end
end
