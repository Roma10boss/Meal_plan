class MealsController < ApplicationController
    before_action :set_meal, only: [:show, :edit, :update]
  
    def index
      if params[:meal_plan_id] && mealplan = MealPlan.find_by_id(params[:meal_plan_id])
        @meals = mealplan.meals.paginate(page: params[:page], per_page: 2)
      else
        @meals = current_user.meals.paginate(page: params[:page], per_page: 2)
      end
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      set_meal
      redirect_if_not_logged_in
    if @meal.update(meal_params)
      flash[:success] = "Your meal was updated!"
      redirect_to meal_path(@meal)
    else
      render :edit
    end
  end
  
  private
    def meal_params
      params.require(:meal).permit(:protein, :day, :vegetable, :side, :beverage_ounces, :beverage, :favorite)
    end
  
    def set_meal
      @meal = Meal.find_by(id: params[:id])
      if !@meal
        flash[:danger] = "Meal not Found!"
        redirect_to meals_path
      end
    end
  end