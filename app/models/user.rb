class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password
  validates :name, presence: true, uniqueness: true
  validates :points, presence: true
  has_many :user_rewards
  has_many :rewards, through: :user_rewards
end
