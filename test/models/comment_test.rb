require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @one = comments(:one)
    @two = comments(:two)
  end

  test "to_s returns comment summary" do
    assert_equal "on #{Date.today}, chandan@westga.com says: \"I am number one!\"", @one.to_s

    assert_equal "on #{Date.today}, temp@gmail.com says: \"Who do I work for?\"", @two.to_s
  end
end
