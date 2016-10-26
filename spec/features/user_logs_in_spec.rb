require 'rails_helper'

describe "existing user can login" do
  it "directs to users path with user logged in" do
    user = create(:user)

    visit login_path
    fill_in 'name', with: user.name
    fill_in 'password', with: "password"
    click_on 'Login'

    expect(page).to have_content("Logged in as #{user.name}")
  end

  it "doesn't authenticate if password aint right" do
    user = create(:user)

    visit login_path
    fill_in 'name', with: user.name
    fill_in 'password', with: "assword"
    click_on 'Login'

    expect(page).to have_content("Try again dingus!")
  end
end
