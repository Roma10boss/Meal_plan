class MealSchedulesController < ApplicationController
    before_action :set_meal_schedules, only: [:edit, :update, :show, :delete]
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]
    before_action :require_same_user, only: [:edit, :update, :delete]
  
    def index
      if params[:meal_id] && meal = Meal.find_by_id(params[:meal_id])
        @meal_schedules = meal.meal_schedules(page: params[:page], per_page: 2)
      else 
        @meal_schedules = current_user.meal_schedules(page: params[:page], per_page: 2)
      end
    end
  
    def new
      if current_user && params[:meal_plan_id] && @mealplan = MealPlan.find_by_id(params[:meal_plan_id])
        @meal_schedule = @mealplan.meal_schedules.build
        @meal_schedule.build_meal
      else
        @meal_schedule = MealSchedule.new
        @meal_schedule.build_meal
      end
    end
  
  
      def create
        @meal_schedule = MealSchedule.new(meal_schedule_params)
        if @meal_schedule.save
          flash[:success] = "Your meal schedule was created!"
          redirect_to meal_schedule_path(@meal_schedule)
        else
          render :new
        end
      end
  
    def show
    end
  
    def edit
    end
  
    def update
      if @meal_schedule.update(meal_schedule_params)
        flash[:success] = "Your meal schedule was updated!"
        redirect_to meal_schedule_path(@meal_schedule)
      else
        render :edit
      end
    end
  
    def destroy
      @meal_schedule.destroy
      flash[:success] = "Your meal schedule was deleted!"
      redirect_to meal_schedules_path
    end
  
    private
  
      def meal_schedule_params
        params.require(:meal_schedule).permit(:eating_time, :meal_type, :meal_id, :meal_plan_id, meal_attributes: [:protein, :vegetable, :side, :day, :beverage, :favorite, :beverage_ounces])
      end
  
      def set_meal_schedules
        @meal_schedule = MealSchedule.find_by(id: params[:id])
        if @meal_schedule.nil?
          flash[:danger] = "Meal Schedule not Found!"
          redirect_to meal_schedules_path
        end
      end
  
      def require_same_user
        set_meal_schedules
        if current_user.id != @meal_schedule.meal_plan.user_id
          flash[:danger] = "You can only edit or delete your own meal schedule"
          redirect_to meal_schedules_path
      end
    end
  end
  