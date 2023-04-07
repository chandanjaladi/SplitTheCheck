class Restaurant < ApplicationRecord
  validates :name, :location, presence: true
  validates :will_split, :will_not_split, numericality: {greater_than_or_equal_to: 0}

  def self.search(name: nil, location: nil)
    if !name.nil? && !name.empty?
      if !location.nil? && !location.empty?
        Restaurant.where("name like :name and location like :location", {name: "%#{name}%", location: "%#{location}%"})
      else
        Restaurant.where("name like :name", {name: "%#{name}%"})
      end
    else
      if !location.nil? && !location.empty?
        Restaurant.where("location like :location", {location: "%#{location}%"})
      else
        Restaurant.all
      end
    end
  end
end
