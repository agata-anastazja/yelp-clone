require 'rails_helper'

feature 'reviewing' do



  scenario 'allows users to leave a review using a form' do
    sign_up
    create_restaurant
    review('so so', 4)
    expect(current_path).to eq '/restaurants'
    click_link "KFC"

    expect(page).to have_content('so so')
  end

  scenario "user can't leave review without signing up" do
    sign_up
    create_restaurant
    sign_out
    expect(page).not_to have_content('Review KFC')
  end

  scenario "user can only leave one review per restaurant" do
    sign_up
    create_restaurant
    review('so so', 4)
    expect(page).not_to have_content('Review KFC')
  end
end
