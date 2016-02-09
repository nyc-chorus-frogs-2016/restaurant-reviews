class ReviewsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @restaurant.reviewable_by? current_user
      create_review @restaurant
    else
      flash.alert = 'You may not review your own restaurant'
      render 'restaurants/show'
    end
  end

  def latest
    @latest = Review.includes(:restaurant).order(created_at: :desc).limit(10)
  end

  private

  def create_review restaurant
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      flash.notice = 'Thanks for your review'
      redirect_to restaurant_path(@restaurant)
    else
      flash.alert = 'Sorry your review failed to save'
      render 'restaurants/show'
    end
  end

  def review_params
    params.require(:review).permit(:rating, :body).merge(reviewer: current_user)
  end
end