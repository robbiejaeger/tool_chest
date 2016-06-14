require 'rails_helper'

RSpec.feature "Tool management", type: :feature do
  scenario "User creates a new tool" do
    category = Category.create(name: "Shaping")
    user = User.create(username: "Robbie", password: "password")
    visit login_path
    fill_in "Username", with: "Robbie"
    fill_in "Password", with: "password"
    click_on "Login"

    # Visit a page with the form to create a new tool
    visit new_tool_path
    # Fill in the tools attributes: name, price, quantity
    fill_in "tool[name]", with: "Hammer" # OR fill_in "Name", with: "Hammer"
    fill_in "tool[price]", with: 10.99
    fill_in "tool[quantity]", with: 12
    select 'Shaping', from: "tool[category_id]"

    # Submit the form
    find(:button, "Create Tool").click
    # Check to see that I was redirected and on the tool show page (should be the last tool in the db)
    expect(current_path).to eq(tool_path(Tool.last.id))
    # Check all the attributes I filled in and submitted now display on the show page
    within("h1") do # within(...) you can go to children of html elements to be more specific
      expect(page).to have_content("Hammer - 12")
    end

    within("#price") do
      expect(page).to have_content("10.99")
    end
  end
end
