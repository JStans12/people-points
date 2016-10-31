require 'rails_helper'

describe "logged in user clicks on redeem points" do
  it "user has enough points for a reward" do
    user = create(:user_with_token)
    create_list(:reward, 10)

    visit login_path
    fill_in 'name', with: user.name
    fill_in 'password', with: "password"
    click_on 'Login'
    click_on 'Redeem Points'

    expect(page).to have_content("You got a reward")
    expect(page).to have_content("Points: 5")
    expect(page).to have_content("Tokens: 0")
  end

  it "user doesn't have enough points for a reward" do
    user = create(:user)

    visit login_path
    fill_in 'name', with: user.name
    fill_in 'password', with: "password"
    click_on 'Login'
    click_on 'Redeem Points'

    expect(page).to have_content("You need 5 points and 2 tokens for a reward!")
  end

end
