require "application_system_test_case"

class RestaurantsTest < ApplicationSystemTestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "visiting the index" do
    visit restaurants_url
    assert_selector "h1", text: "Restaurants"
  end

  test "creating a Restaurant" do
    visit restaurants_url
    click_on "Add new Restaurant"

    fill_in "Location", with: @restaurant.location
    fill_in "Name", with: @restaurant.name
    fill_in "Will not split", with: @restaurant.will_not_split
    fill_in "Will split", with: @restaurant.will_split
    click_on "Create Restaurant"

    assert_text "Restaurant was successfully created"
    click_on "Show all Restaurants"
  end

  test "updating a Restaurant" do
    visit restaurants_url
    click_on "Edit", match: :first

    fill_in "Location", with: @restaurant.location
    fill_in "Name", with: @restaurant.name
    fill_in "Will not split", with: @restaurant.will_not_split
    fill_in "Will split", with: @restaurant.will_split
    click_on "Update Restaurant"

    assert_text "Restaurant was successfully updated"
    click_on "Show all Restaurants"
  end

end
