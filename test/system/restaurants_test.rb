require "application_system_test_case"

class RestaurantsTest < ApplicationSystemTestCase
  setup do
    @restaurant = restaurants(:one)
    @user = users(:one)
  end

  # test "visiting the index" do
  #   visit restaurants_url
  #   assert_selector "h1", text: "Restaurants"
  # end
  #
  # test "creating a Restaurant" do
  #   visit restaurants_url
  #   # get edit_restaurant_url(@restaurant)
  #   visit new_user_session_url
  #   sign_in @user
  #   # click_on "Login"
  #   # fill_in "Email"
  #   # fill_in "Password"
  #   # click_on "Login"
  #   click_on "Add new Restaurant"
  #
  #   fill_in "Location", with: @restaurant.location
  #   fill_in "Name", with: @restaurant.name
  #
  #   click_on "Create Restaurant"
  #
  #   assert_text "Restaurant was successfully created"
  #   click_on "Show all Restaurants"
  # end
  #
  # test "updating a Restaurant" do
  #   visit restaurants_url
  #   assert_redirected_to new_user_session_url
  #   sign_in @user
  #   click_on "Edit", match: :first
  #
  #   fill_in "Location", with: @restaurant.location
  #   fill_in "Name", with: @restaurant.name
  #
  #   click_on "Update Restaurant"
  #
  #   assert_text "Restaurant was successfully updated"
  #   click_on "Show all Restaurants"
  # end

end
