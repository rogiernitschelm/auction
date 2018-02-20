class RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :redirect_users
  before_action :authorize_guest_actions

  def new
  end

  def create
    begin
      user = RegisterUser.run(create_params).user
      session[:user_id] = user.id
      redirect_to root_path
    rescue ActiveRecord::RecordInvalid => e
      flash[:error] = e.message
      flash[:form_values] = redirect_params(*e.record.errors.keys)

      redirect_back fallback_location: new_registration_path
    end
  end

  private

  def redirect_params(excepted_keys)
    create_params.except(*excepted_keys)
  end

  def create_params
    params.permit(
      :first_name,
      :infix,
      :last_name,
      :password,
      :email,
      :usertype,
      :password_confirmation
    )
  end

  def authorize_guest_actions
    authorize! :perform, :guest_actions
  end
end
