require 'rails_helper'

describe "usera writes an endorsement for userb" do
  it "usera gains a token and loses points, while userb gains points" do
    usera, userb = create_list(:user, 2)

    visit login_path
    fill_in 'name', with: usera.name
    fill_in 'password', with: "password"
    click_on 'Login'

    expect(page).to have_content("Logged in as #{usera.name}")

    click_on "Endorse"

    expect(page).to have_content("Endorse #{userb.name}")

    fill_in 'endorsement[body]', with: "things and stuff"
    click_on 'Create Endorsement'

    expect(page).to have_content("things and stuff")

    click_on 'People Points:'

    expect(page).to have_content("Points: 12")
    expect(page).to have_content("Points: 9")
    expect(page).to have_content("Tokens: 1")
  end
end
