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
      @errors = e.message

      render 'shared/forms/_validation_errors', errors: @errors
    end
  end

  private

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
