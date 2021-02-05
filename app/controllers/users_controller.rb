class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:show]

  
  
def new
  @user = User.new
end



def create
  @user = User.new(user_params)
  if @user.save
    flash[:success] = "Welcome #{@user.name} to your Meal Tracker!"
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  else
    render :new
  end
end

def show
  @user = User.find_by_id(params[:id])
  @user_mealplans = @user.meal_plans.paginate(page: params[:page], per_page: 2)
end

def omniauth_failure
  redirect_to init_sign_in_users_path
  #redirect wherever you want.
  redirect_to '/login'
end

private
def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
end 