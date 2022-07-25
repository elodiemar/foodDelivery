class MealsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @meal = Meal.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @meal = Meal.new(meal_params)
    @meal.restaurant = @restaurant
    if @meal.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @meal.update(meal_params)
      redirect_to restaurant_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    if @meal.destroy
      redirect_to restaurant_path(@meal.restaurant),  status: :see_other
    else
      render :destroy, status: :unprocessable_entity
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :price, :photo, :restaurant_id)
  end
end
