class Reward < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :image_link, presence: true
  has_many :user_rewards
  has_many :users, through: :user_rewards
end
