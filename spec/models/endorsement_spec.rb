require 'rails_helper'

RSpec.describe Endorsement, type: :model do

  describe "relationships" do
    it "belongsto user" do
    user = User.create(name: "joey", password: "password", points: 0)
    endorsement = user.endorsements.new(body: "asdf")

    expect(endorsement).to respond_to(:user)
    end
  end

end
