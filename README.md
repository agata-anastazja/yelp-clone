# Yelp Clone

I have created a Yelp Clone, which is a popular web application that allows users to rate and review restaurants, and find other diner's ratings and comments. This clone was built using the Ruby on Rails framework.


## How to Use the App

- In the terminal, ```git clone https://github.com/DarkChocLatte/yelp_app_2```.

- In the terminal, cd into ```yelp2```.

- In the terminal, create your databases by running the ```bin/rake db:create``` command.

- In the terminal, migrate your databases by running the ```bin/rake db:migrate``` command.

*######If you would like to have functionality that allows a user to sign in using facebook, please create a 'config/env.yml' file and navigate to 'https://developers.facebook.com/' and log in. After creating a facebook login product add your API key values to the 'env.yml' file being sure to name the key the same as displayed in the 'config/secrets.yml' file.*

- In the terminal, run the rails server by running the ```bin/rails s``` command.

- Navigate to http://localhost:3000/ in the browser

## Technologies Used

- This project used the Ruby on Rails framework.

- The envyable gem was used to help hide sensitive information.

- The devise gem was used to create our user model with a lot of in built functionality.

- The omniauth-facebook gem was used to allow third-party authentication with facebook.


## Instructions for Running the Tests

## Interface
