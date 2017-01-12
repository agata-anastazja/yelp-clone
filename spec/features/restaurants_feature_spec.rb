require 'rails_helper'

feature 'restaurants' do

  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
  before do
    sign_up
    create_restaurant
  end

  scenario 'display restaurants' do
    visit '/restaurants'
    expect(page).to have_content('KFC')
    expect(page).not_to have_content('No restaurants yet')
    end

  end

  context 'creating restaurants' do
  scenario 'prompts user to fill out a form, then displays the new restaurant' do
    sign_up
    create_restaurant
    expect(page).to have_content 'KFC'
    expect(current_path).to eq '/restaurants'
  end

  scenario 'When user is not signed up they can not create a restaurant' do
    visit('/')
    click_link 'Add a restaurant'
    expect(page).to have_content('You need to sign in or sign up before continuing.')

  end

  scenario 'is not valid unless it has a unique name' do
    sign_up
    create_restaurant
    restaurant = Restaurant.new(name: "KFC")
    expect(restaurant).to have(1).error_on(:name)
  end
end

  context 'an invalid restaurant' do
    scenario 'does not let you submit a name that is too short' do
      sign_up
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KF'
      click_button 'Create Restaurant'
      expect(page).not_to have_css 'h2', text: 'KF'
      expect(page).to have_content 'error'
    end
  end

  context 'viewing restaurants' do
    scenario 'lets a user view a restaurant' do
      sign_up
      create_restaurant
      click_link 'KFC'
      expect(page).to have_content 'KFC'
    end
  end

  context 'editing restaurants' do
    scenario 'let a user edit a restaurant' do
      sign_up
      create_restaurant
      click_link 'Edit KFC'
      fill_in 'Name', with: 'Kentucky Fried Chicken'
      click_button 'Update Restaurant'
      click_link 'Kentucky Fried Chicken'
      expect(page).to have_content 'Kentucky Fried Chicken'
    end
  end

  context 'deleting restaurants' do
    before do
      sign_up
      create_restaurant
    end
    scenario 'removes a restaurant when a user clicks a delete link' do
      visit '/restaurants'
      click_link 'Delete KFC'
      expect(page).not_to have_content 'KFC'
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end

end
