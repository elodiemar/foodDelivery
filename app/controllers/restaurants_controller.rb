class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy ]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @meal.restaurant = @restaurant
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurants_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurants_params)
      redirect_to restaurant_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @restaurant.destroy(restaurants_params)
      redirect_to restaurant_path, status: :see_other
    else
      render :destroy, status: :unprocessable_entity
    end
  end

  private

  def restaurants_params
    params.require(:restaurant).permit(:name, :address, :photo)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
