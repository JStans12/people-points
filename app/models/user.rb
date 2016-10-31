class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password
  validates :name, presence: true, uniqueness: true
  validates :points, presence: true
  has_many :endorsements, dependent: :destroy
  has_many :user_rewards, dependent: :destroy
  has_many :rewards, through: :user_rewards, dependent: :destroy

  enum role: [:default, :admin]

  def charge
    self.points -= 5
    self.tokens -= 2
  end

  def reward
    self.rewards << random_reward
  end

  def random_reward
    random_num = rand(10000)
    return Reward.find(10) if random_num == 0
    return Reward.find(random_num.to_s.first.to_i)
  end

  def most_recent_reward
    Reward.find(self.user_rewards.order(:id).last.reward_id).name
  end
end
