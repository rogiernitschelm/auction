class Admin::UsersController < ApplicationController
  before_action :redirect_non_admins
  load_and_authorize_resource

  def index
  end
end
