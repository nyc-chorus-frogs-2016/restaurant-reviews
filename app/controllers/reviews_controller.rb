class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      flash.notice = 'Thanks for your review'
      redirect_to restaurant_path(@restaurant)
    else
      flash.alert = 'Sorry your review failed to save'
      render 'restaurants/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body).merge(reviewer: current_user)
  end
end