def log_in
  fill_in "Email", with: "chris@gmail.com"
  fill_in "Password", with: "password"
  click_button "Log in"
end

def sign_in_and_add_restaurant
  visit '/restaurants'
  click_link 'Sign in'
  log_in
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'KFC'
  click_button 'Create Restaurant'
end

def edit_restaurant
  visit '/restaurants'
  click_link 'Edit KFC'
  fill_in 'Name', with: 'Kentucky Fried Chicken'
  fill_in 'Description', with: "Deep fried goodness"
  click_button "Update Restaurant"
end
