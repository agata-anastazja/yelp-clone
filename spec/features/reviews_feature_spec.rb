require 'rails_helper'
require 'web_helpers'

feature "reviewing" do

  before do
    @user = User.create(email: "chris@gmail.com", password: "password")
    @user2 = User.create(email: "agata@gmail.com", password: "password")
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

  scenario "users cannot add a review when not signed in" do
    sign_in_and_add_restaurant
    click_link "Sign out"
    expect(page).not_to have_content "Review KFC"
  end

  scenario "a user can delete their own review" do
    sign_in_and_add_restaurant
    leave_review("Awesome", 1)
    expect(page).to have_link "Delete review"
  end

  scenario "a user cannot delete a review that is not theirs" do
    sign_in_and_add_restaurant
    leave_review("Awesome", 1)
    click_link "Sign out"
    sign_in_second_user
    expect(page).not_to have_link "Delete review"
  end



end
