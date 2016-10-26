require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do

    it "is valid with name, password and points" do
      user = User.new(name: "joey", password: "password", points: 0)
      expect(user).to be_valid
    end

    it "is invalid without name" do
      user = User.new(password: "password", points: 0)
      expect(user).to be_invalid
    end

    it "is invalid without password" do
      user = User.new(name: "joey", points: 0)
      expect(user).to be_invalid
    end

    it "is invalid without points" do
      user = User.new(name: "joey", password: "password")
      expect(user).to be_invalid
    end

    it "is invalid with same name" do
      user = User.create(name: "joey", password: "password", points: 0)
      user2 = User.new(name: "joey", password: "password", points: 0)
      expect(user2).to be_invalid
    end
  end

  describe "relationships" do
    it "has many rewards" do
      user = User.new(name: "joey", password: "password", points: 0)
      expect(user).to respond_to(:rewards)
    end

    it "has many endorsements" do
      user = User.new(name: "joey", password: "password", points: 0)
      expect(user).to respond_to(:endorsements)
    end
  end
end
