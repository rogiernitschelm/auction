class User < ApplicationRecord
  has_secure_password

  has_one :seller, dependent: :delete
  has_one :buyer, dependent: :delete
  has_one :admin, dependent: :delete

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 8, maximum: 40 }, presence: true, if: :password
  validates :email, uniqueness: { case_sensitive: false }, presence: true, format: {
    with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  }

  before_save :strip_and_downcase

  def full_name
    [first_name, infix, last_name].compact.join(' ')
  end

  def seller?
    seller.present?
  end

  def buyer?
    buyer.present?
  end

  def admin?
    admin.present?
  end

  def self.selectable_usertypes
    [
      ['Bieder', 'buyer'],
      ['Aanbieder', 'seller']
    ]
  end

  private

  def strip_and_downcase
    email.strip!
    email.downcase!
  end
end
