require "test_helper"

class VotesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @vote = votes(:one)
    @user = users(:one)
  end

  # test "should get index" do
  #   get votes_url
  #   assert_response :success
  # end
  #
  # test "should get new" do
  #   get new_vote_url
  #   assert_response :success
  # end

  test "should create vote" do
    assert_no_difference('Vote.count') do
      post votes_url, params: {  restaurant_id: @vote.restaurant_id, user_id: @vote.user_id, will_split?: @vote.will_split? }
    end
    sign_in @user
    assert_difference('Vote.count') do
      post votes_url, params: { restaurant_id: @vote.restaurant_id, user_id: @vote.user_id, will_split?: @vote.will_split? }
    end

  #   assert_redirected_to vote_url(Vote.last)
  # end
  #
  # test "should show vote" do
  #   get vote_url(@vote)
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get edit_vote_url(@vote)
  #   assert_response :success
  # end
  #
  # test "should update vote" do
  #   patch vote_url(@vote), params: { vote: { restaurant_id: @vote.restaurant_id, user_id: @vote.user_id, will_split?: @vote.will_split? } }
  #   assert_redirected_to vote_url(@vote)
  # end
  #
  # test "should destroy vote" do
  #   assert_difference('Vote.count', -1) do
  #     delete vote_url(@vote)
  #   end

    assert_redirected_to restaurants_url
  end
end
