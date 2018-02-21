module Redirect
  def redirect_non_users
    redirect_to root_path unless current_user
  end

  def redirect_users
    redirect_to root_path if current_user
  end

  def redirect_sellers
    redirect_to root_path if current_user&.seller?
  end

  def redirect_non_sellers
    redirect_to root_path unless current_user&.seller?
  end

  def redirect_buyers
    redirect_to root_path if current_user&.buyer?
  end

  def redirect_non_buyers
    redirect_to root_path unless current_user&.buyer?
  end

  def redirect_admins
    redirect_to root_path if current_user&.admin?
  end

  def redirect_non_admins
    redirect_to root_path unless current_user&.admin?
  end
end
