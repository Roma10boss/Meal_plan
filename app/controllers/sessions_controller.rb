class SessionsController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:show]
    require 'securerandom'

    def create 

        if auth 
            @user = User.find_or_create_by(email: auth['info']['email']) do |u|
               u.password = SecureRandom.hex(12) 
            
            end 
            
            if @user 
                flash[:success] = "Welcome back #{@user.name}!"
                redirect_to meal_plans_path
            else
                flash[:error] = "Sorry, there was an error with your account!"
                redirect_to '/login'
            end 
        end 
           
    end

    def new
        @user = User.new
        render :login
    end

    def home
        redirect_to meal_plans_path if logged_in?
    end

    def destroy
        session.clear
        flash[:success] = "You have logged out"
        redirect_to '/'
    end


    private
    def auth
      request.env['omniauth.auth']
    end

end 