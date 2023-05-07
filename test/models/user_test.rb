require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:one)
    @gg_e = restaurants(:one)
    @gg_t = restaurants(:two)
  end

  test 'returns whether the user has favorited a specific restaurant' do
    assert !(@user.favorited? @gg_e)
    assert !(@user.favorited? @gg_t)
  end
end
