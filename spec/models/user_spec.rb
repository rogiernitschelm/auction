require 'rails_helper'

RSpec.describe User, type: :model do
  let(:attributes) {
    {
      email: 'mail@hoogle.nom',
      password: 'abcd1234',
      first_name: 'Vis',
      infix: 'genaamd',
      last_name: 'Henk'
    }
  }

  describe 'validations' do
    it 'should be valid with valid attributes' do
      expect(User.new(attributes)).to be_valid
    end

    it 'should be invalid without a password' do
      expect(User.new(invalid_attributes(:password))).to be_invalid
    end

    it 'should be invalid without an email' do
      expect(User.new(invalid_attributes(:email))).to be_invalid
    end

    it 'should be invalid with a short password' do
      invalid_attributes = attributes
      invalid_attributes[:password] = 'abc'

      expect(User.new(invalid_attributes)).to be_invalid
    end
  end

  describe 'authentication' do
    let(:user) { User.create!(attributes) }

    it 'should return false when an incorrect password is provided' do
      expect(user.authenticate('dcba4321')).to be(false)
    end

    it 'should return false when no password is provided' do
      expect(user.authenticate(nil)).to be(false)
    end

    it 'should return true when the password is correct' do
      expect(user.authenticate('abcd1234')).to eq(user)
    end
  end

  def invalid_attributes(key)
    attributes.delete(key)
    attributes
  end
end
