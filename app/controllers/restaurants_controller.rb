class RestaurantsController < ApplicationController
  before_action :ensure_owner, only: [:edit, :update, :destroy]

  def index
    if  params[:order] == "rating"
      @restaurants = Restaurant.by_average_rating

    elsif params[:order] == "cuisine"
      @restaurants = Restaurant.order([:cuisine, :name])
    else
      @restaurants = Restaurant.order(:name)
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      flash.notice = 'Restaurant saved'
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash.notice = 'Restaurant saved'
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def ensure_owner
    @restaurant = Restaurant.find(params[:id])
    unless @restaurant.editable_by? current_user
      flash[:error] = "You may not update #{@restaurant.name}"
      redirect_to restaurant_path(@restaurant)
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :address, :city, :state, :zip).merge(creator:current_user)
  end
end
