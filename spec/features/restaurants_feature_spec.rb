require 'rails_helper'
require 'web_helpers'

feature 'restaurants' do

  before do
    @user = User.create(email: "chris@gmail.com", password: "password")
  end

  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do

    scenario 'display restaurants' do
      sign_in_and_add_restaurant
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants yet')
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'an invalid restaurant' do
    scenario 'does not let you submit a name that is too short' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      log_in
      fill_in 'Name', with: 'kf'
      click_button 'Create Restaurant'
      expect(page).not_to have_css 'h2', text: 'kf'
      expect(page).to have_content 'error'
    end
  end

  context 'viewing restaurants' do

    scenario 'lets a user view a restaurant' do
      sign_in_and_add_restaurant
      visit '/restaurants'
      click_link 'KFC'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq "/restaurants/#{@user.restaurants.first.id}"
    end

  end

  context "editing restaurants" do

    scenario "let a user edit a restaurant" do
      sign_in_and_add_restaurant
      edit_restaurant
      click_link "Kentucky Fried Chicken"
      expect(page).to have_content "Kentucky Fried Chicken"
      expect(page).to have_content "Deep fried goodness"
      expect(current_path).to eq "/restaurants/#{@user.restaurants.first.id}"
    end

  end

  context 'deleting restaurants' do

    scenario 'removes a restaurant when a user clicks a delete link' do
      sign_in_and_add_restaurant
      click_link 'Delete KFC'
      expect(page).not_to have_content('KFC')
      expect(page).to have_content('Restaurant deleted successfully')
    end

  end
end
