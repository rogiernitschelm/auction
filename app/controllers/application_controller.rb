class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  check_authorization

  include CanCan::ControllerAdditions
  include Layout
  include Redirect
  include Authorization
  include Namespace

  helper_method :current_user
  layout :get_layout

  private

  def current_user
    @current_user ||= begin
      User.find(session[:user_id]) unless session[:user_id].nil?
    end
  end
end
