def log_in
  fill_in "Email", with: "chris@gmail.com"
  fill_in "Password", with: "password"
  click_button "Log in"
end
