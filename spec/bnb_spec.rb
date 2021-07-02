require_relative '../models/bnb'
require_relative '../models/user'

describe Bnb do
  describe '.all' do
    it 'returns a list of properties' do
      user = User.create(email: 'test9@example.com', password: 'password123')
      properties = Bnb.create(name: 'house', description: 'h', price: '3000', availability_start: "2021-07-01", availability_end: "2021-10-02", user_id: user.id)
      Bnb.create(name: 'boat', description: 'b', price: '400', availability_start: "2021-07-01", availability_end: "2021-10-02", user_id: user.id)
      Bnb.create(name: 'houseboat', description: 'hb', price: '600', availability_start: "2021-07-01", availability_end: "2021-10-02", user_id: user.id)
      properties = Bnb.all
      expect(properties.length).to eq 3
      expect(properties.first.name).to eq 'house'
      expect(properties.first.description).to eq 'h'
      expect(properties.first.price).to eq '3000'
    end
  end

  describe '.create' do
    it 'creates a new properties' do
      properties = Bnb.create(name: 'room60', description: 'the sixtieth room', price: '6000', availability_start: "2021-07-01", availability_end: "2021-10-02", user_id: 1)
      expect(properties).to be_a Bnb
      expect(properties.name).to eq 'room60'
      expect(properties.description).to eq 'the sixtieth room'
      expect(properties.price).to eq '6000'
    end
  end
end
