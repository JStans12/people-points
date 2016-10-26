require 'rails_helper'

describe "user navigates to root" do
  it "user sees users on frontpage" do
    user1, user2, user3 = create_list(:user, 3)

    visit '/'

    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.points)
  end
end
