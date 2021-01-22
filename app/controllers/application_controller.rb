class ApplicationController < ActionController::Base
  helper_method  :logged_in?
    protect_from_forgery with: :exception
  include ApplicationHelper

private

  def redirect_if_not_logged_in
    if !logged_in?
      flash[:danger] = "You must be logged in to view this page."
      redirect_to '/'
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user])
  end

  
  def logged_in?
    current_user != nil
  end
end