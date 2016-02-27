class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  include SessionsHelper
  include UsersHelper

  def current_user
    if User.find_by id: session[:user_id]
      @current_user ||= User.find session[:user_id]
    end
  end
  def current_user?(user)
    user == current_user
  end
end