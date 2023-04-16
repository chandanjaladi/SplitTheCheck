class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.integer :will_split, default: 0
      t.integer :will_not_split, default: 0
      change_column_default :restaurants, :will_split, from: nil, to: 0
      change_column_default :restaurants, :will_not_split, from: nil, to: 0

      t.timestamps

    end
  end

end
