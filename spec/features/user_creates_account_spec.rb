require 'rails_helper'

describe "user can create a new account" do
  it "returns to the users index and shows new user on pages" do

    visit '/login'
    fill_in 'user[name]', with: "Chad"
    fill_in 'user[image_link]', with: "https://upload.wikimedia.org/wikipedia/commons/b/b2/Hausziege_04.jpg"
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: "password"
    click_on 'Create Account'

    expect(page).to have_link("Logout")
    expect(page).to have_content("Chad")
  end

  it "returns and error if passwords and password confirmation don't match" do

    visit '/login'
    fill_in 'user[name]', with: "Chad"
    fill_in 'user[image_link]', with: "https://upload.wikimedia.org/wikipedia/commons/b/b2/Hausziege_04.jpg"
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: "assword"
    click_on 'Create Account'

    expect(page).to have_link("Login / Create Account")
    expect(page).to_not have_content("Chad")
  end
end
