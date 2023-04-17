require "test_helper"

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :restaurants

  test 'gets number of "will split" votes associated with the restaurant' do
    assert_equal 1, restaurants(:one).get_will_split_votes
  end

  test 'gets number of "won\'t split" votes associated with the restaurant' do
    assert_equal 0, restaurants(:one).get_will_not_split_votes
  end

  class SearchTest < ActiveSupport::TestCase
    test "returns all restaurants if both name & location are missing or blank" do
      assert_equal Restaurant.all, Restaurant.search()
      assert_equal Restaurant.all, Restaurant.search(name: nil, location: nil)
      assert_equal Restaurant.all, Restaurant.search(name: nil)
      assert_equal Restaurant.all, Restaurant.search(name: nil)
      assert_equal Restaurant.all, Restaurant.search(name: "", location: "")
      assert_equal Restaurant.all, Restaurant.search(name: nil, location: "")
      assert_equal Restaurant.all, Restaurant.search(name: "", location: nil)
    end

    test "returns restaurants with matching name" do
      assert_equal [restaurants(:one)], Restaurant.search(name: "Cheesecake Factory")
      assert_equal [restaurants(:four)], Restaurant.search(name: "Sp")
    end

    test "return restaurants with matching location" do
      assert_equal [restaurants(:three), restaurants(:four)], Restaurant.search(location: "Atlanta")
      assert_equal [restaurants(:three), restaurants(:four)], Restaurant.search(location: "Atl")
    end

    test "returns restaurants with matching name & location" do
      assert_equal [restaurants(:one)], Restaurant.search(name: "Cheesecake", location: "Carrollton")
    end
  end
end
