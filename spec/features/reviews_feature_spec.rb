require 'rails_helper'
require 'web_helpers'

feature "reviewing" do

  before do
    @user = User.create(email: "chris@gmail.com", password: "password")
  end

  scenario "allows users to leave a review using a form" do
    sign_in_and_add_restaurant
    click_link "Review KFC"
    fill_in "Thoughts", with: "so so"
    select "3", from: "Rating"
    click_button "Leave Review"

    expect(current_path).to eq "/restaurants"
    expect(page).to have_content "so so"
  end
end
