class UsersController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:show]
    attr_accessor :name
  
    def new
      @user = User.new
    end
  
    def create(user_params)
        @user = User.new(params[:user])
        if @user.save
          redirect_to users_path
        else
          render :new
        end
      end

      def user_params
        params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
      end
  
    def show
      @user = User.find_by_id(params[:id])
      @user_mealplans = @user.meal_plans.paginate(page: params[:page], per_page: 2)
    end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
