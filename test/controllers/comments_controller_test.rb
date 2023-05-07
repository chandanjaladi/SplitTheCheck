require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @comment = comments(:one)
    @user = users(:one)
    @gg_e = restaurants(:one)
  end

  test "should get new" do
    get new_comment_url(restaurant_id: @gg_e)
    assert_redirected_to new_user_session_url
    sign_in @user

    get new_comment_url(restaurant_id: @gg_e)
    assert_response :success
  end

  test "should create comment" do
    get new_comment_url(restaurant_id: @gg_e)
    assert_redirected_to new_user_session_url
    sign_in @user
    assert_no_difference('Comment.count') do
      post comments_url, params: { comment: { body: @comment.body } }
    end
    assert_redirected_to restaurants_url

    assert_difference('Comment.count') do
      get new_comment_url(restaurant_id: @gg_e)
      post comments_url, params: { comment: { body: @comment.body } }
    end

  assert_redirected_to restaurant_url(Comment.last.restaurant_id)
  end
end
