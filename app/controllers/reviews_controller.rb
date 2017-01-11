require 'with_user_association_extension'

class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    # @restaurant.reviews.create(review_params)
    @review = @restaurant.reviews.build_with_user(review_params)


    if @review.save
      redirect_to restaurant_path
    else
      if @review.errors[:user]
        redirect_to restaurant_path, alert: "You have already reviewed this restaurant"
      else
        render :new
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

end
