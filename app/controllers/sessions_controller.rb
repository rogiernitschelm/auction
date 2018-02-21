class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  before_action :redirect_users, except: :destroy
  before_action :authorize_guest_actions, except: :destroy
  before_action :authorize_non_guest_actions, only: :destroy

  def new
  end

  def create
    user = User.find_by(email: create_params[:email])

    if user&.authenticate(create_params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      @errors = t(:email_or_password_incorrect)

      render 'shared/forms/_validation_errors', errors: @errors
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def create_params
    params.permit(:email, :password)
  end

  def authorize_guest_actions
    authorize! :perform, :guest_actions
  end

  def authorize_non_guest_actions
    authorize! :perform, :non_guest_actions
  end
end
