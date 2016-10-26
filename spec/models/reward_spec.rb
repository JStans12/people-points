require 'rails_helper'

RSpec.describe Reward, type: :model do
  describe "validations" do

    it "is valid with name and image_link" do
      reward = Reward.new(name: "reward", image_link: "img")
      expect(reward).to be_valid
    end

    it "is invalid without name" do
      reward = Reward.new(image_link: "img")
      expect(reward).to be_invalid
    end

    it "is invalid without image_link" do
      reward = Reward.new(name: "reward")
      expect(reward).to be_invalid
    end

    it "is invalid with same name" do
      reward = Reward.create(name: "reward", image_link: "img")
      reward2 = Reward.new(name: "reward", image_link: "img")
      expect(reward2).to be_invalid
    end
  end

  describe "relationships" do
    it "has many users" do
      reward = Reward.new(name: "reward", image_link: "img")
      expect(reward).to respond_to(:users)
    end
  end
end
