require 'rails_helper'

describe Restaurant, type: :model do

    let(:user) { User.create(email: "test@test.com", password: "password")}
    let(:restaurant) {user.restaurants.create(name: "Moe's Tavern")}

  it 'is not valid with a name of less than three characters' do
    restaurant = user.restaurants.create(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it "is not valid unless it has an unique name" do
    restaurant = Restaurant.new(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end


  describe "Reviews" do
    describe "Build with user" do

      let(:user) {User.create(email: "test@test.com", password: "password")}
      let(:restaurant) {user.restaurants.create name: "Test"}
      let(:review_params) {{rating: 5, thoughts: "yum"}}

      subject(:review) { restaurant.reviews.build_with_user(review_params, user)}

      it "builds a review" do
        expect(review).to be_a Review
      end

      it "builds a review asscociated with the specified user" do
        expect(review.user).to eq user
      end
    end
  end
end
