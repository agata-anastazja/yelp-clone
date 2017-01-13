def sign_up
  visit('/')
  click_link('Sign up')
  fill_in 'user_email', with: 'test@example.com'
  fill_in 'user_password', with: 'testtest'
  fill_in 'user_password_confirmation', with: 'testtest'
  click_button 'Sign up'
end

def create_restaurant
  visit '/restaurants'
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'KFC'
  click_button 'Create Restaurant'
end

def sign_out
  click_link('Sign out')
end

def sign_up_second_user
  visit('/')
  click_link('Sign up')
  fill_in 'user_email', with: 'test2@example.com'
  fill_in 'user_password', with: 'testtest'
  fill_in 'user_password_confirmation', with: 'testtest'
  click_button 'Sign up'
end
