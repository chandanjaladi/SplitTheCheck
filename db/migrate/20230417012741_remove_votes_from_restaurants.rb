class RemoveVotesFromRestaurants < ActiveRecord::Migration[6.1]
  def change
    remove_column :restaurants, :will_split, :integer
    remove_column :restaurants, :will_not_split, :integer
  end
end
