require 'rails_helper'

RSpec.feature "UserCanDiveIntoZipSearchResults", type: :feature do
  describe "user exists" do
    it "can search for stores" do
      VCR.use_cassette "feature_user_can_dig_into_store" do
# As a user
# After I have searched a zip code for stores
# When I click the name of a store
# Then my current path should be "/stores/:store_id"
# I should see the store name, store type and address with city, state and zip
# I should see an unordered list of the store hours in the following format:
#   * Mon: 10am-9pm
#   * Tue: 10am-9pm
#   * Wed: 10am-9pm
#   * Thurs: 10am-9pm
#   * Fri: 10am-9pm
#   * Sat: 10am-9pm
#   * Sun: 11am-7pm
        visit root_path
        within ".search-box" do
          fill_in "Zip", with: "80202"
          click_on "Search"
        end

        expect(current_path).to eq(search_path)

        expect(page).to have_content("17 Total Stores")

        within ".store-1" do
          click_on("Best Buy Mobile - Cherry Creek Shopping Center")
        end

        within ".basic-info" do
          expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
          expect(page).to have_content("Mobile")
          expect(page).to have_content("123 address, Denver, CO, 80202")
        end

        within ".hours" do
          expect(page).to have_content("Mon: 10am-9pm")
          expect(page).to have_content("Tue: 10am-9pm")
          expect(page).to have_content("Wed: 10am-9pm")
          expect(page).to have_content("Thurs: 10am-9pm")
          expect(page).to have_content("Fri: 10am-9pm")
          expect(page).to have_content("Sat: 10am-9pm")
          expect(page).to have_content("Sun: 11am-7pm")
          
        end

      end
    end
  end

end
