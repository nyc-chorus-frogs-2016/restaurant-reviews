class RestaurantsController < ApplicationController
  def index
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end
end