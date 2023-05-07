class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  validates :username, uniqueness: true, presence: true
  has_many :votes, dependent: :destroy
  has_many :favorites
  has_many :restaurants, through: :favorites
  has_many :comments, dependent: :destroy

  def favorited? restaurant_id
    restaurants.include? restaurant_id
  end
end
