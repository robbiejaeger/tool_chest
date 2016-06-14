require 'rails_helper'

RSpec.feature "Registered user can login" do
  scenario "they login and see only the tools in their toolbox" do
    user1 = User.create(username: "Robbie", password: "password")
    tool1 = user1.tools.create(name: "Screwdriver", price: 10.99, quantity: 5)

    user2 = User.create(username: "Bob", password: "password")
    tool2 = user2.tools.create(name: "Hammer", price: 11.99, quantity: 6)

    visit login_path
    fill_in "Username", with: "Robbie"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(page).to have_content "Hi, Robbie"
    expect(page).to have_content "Screwdriver"
    expect(page).to_not have_content "Hammer"
  end
end
