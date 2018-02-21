require 'rails_helper'

RSpec.describe RegisterUser, type: :service do
  let(:attributes) {
    {
      email: 'mail@hoogle.nom',
      password: 'abcd1234',
      first_name: 'Vis',
      infix: 'genaamd',
      last_name: 'Henk',
    }
  }

  before do
    expect(User).to receive(:create!).with(attributes)
  end

  it 'should register a user as a seller' do
    expect(Seller).to receive(:create!)
    expect(Buyer).not_to receive(:create!)

    described_class.run(**attributes, usertype: 'seller')
  end

  it 'should register a user as a buyer' do
    expect(Seller).not_to receive(:create!)
    expect(Buyer).to receive(:create!)

    described_class.run(**attributes, usertype: 'buyer')
  end
end
