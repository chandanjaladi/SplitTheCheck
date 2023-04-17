require "test_helper"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @restaurant = restaurants(:one)
    @user = users(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should get new" do

    sign_in @user
    get new_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
    get edit_restaurant_url(@restaurant)
    assert_redirected_to new_user_session_url
    sign_in @user
    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { location: @restaurant.location, name: @restaurant.name } }
    end

    assert_redirected_to restaurant_url(Restaurant.last)
  end

  # test "should show restaurant" do
  #   get restaurant_url(@restaurant)
  #   assert_response :success
  # end

  test "should get edit" do
    get edit_restaurant_url(@restaurant)
    assert_redirected_to new_user_session_url
    sign_in @user
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should update restaurant" do
    get edit_restaurant_url(@restaurant)
    assert_redirected_to new_user_session_url
    sign_in @user
    patch restaurant_url(@restaurant), params: { restaurant: { location: @restaurant.location, name: @restaurant.name } }
    assert_redirected_to restaurant_url(@restaurant)
  end

  # test 'should increase "Will Split" votes on button press' do
  #   assert_difference('Restaurant.find(@restaurant.id)[:will_split]', 1) do
  #     post vote_will_split_url(@restaurant)
  #   end
  #
  #   assert_redirected_to restaurants_url
  # end
  #
  # test 'should increase "Won\'t Split" votes on button press' do
  #   assert_difference('Restaurant.find(@restaurant.id)[:will_not_split]', 1) do
  #     post vote_will_not_split_url(@restaurant)
  #   end
  #
  #   assert_redirected_to restaurants_url
  # end

  test 'should search restaurants' do
    get search_url, params: {name: "Cheesecake", location: "Carr"}
    assert_response :success
  end


end
