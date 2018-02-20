class RegisterUser < Service
  attr_reader :params,
    :user,
    :seller,
    :buyer,
    :usertype

  def initialize(params)
    indifferent_params = params.with_indifferent_access

    @params = indifferent_params.except(:usertype)
    @usertype = indifferent_params.fetch(:usertype)
  end

  def run
    User.transaction do
      create_user
      create_association
    end
  end

  private

  def create_association
    case usertype
      when 'buyer' then create_buyer
      when 'seller' then create_seller
      else raise ActiveRecord::RecordInvalid.new
    end
  end

  def create_user
    @user ||= User.create!(params)
  end

  def create_seller
    @seller ||= Seller.create!(user: user)
  end

  def create_buyer
    @buyer ||= Buyer.create!(user: user)
  end
end
