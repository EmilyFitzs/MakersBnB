require 'bnb'

describe Bnb do
  describe '.all' do
    it 'returns a list of properties' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO properties (name, description, price) VALUES('room one', 'king', '75');")
      connection.exec("INSERT INTO properties (name, description, price) VALUES('room two', 'queen', '67');")
      properties = Bnb.all
      expect(properties).to include('room one', 'king', '75')
      expect(properties).to include('room two', 'queen', '67')
    end
  end

  describe '.create' do
    it 'creates a post for a property' do
      Bnb.create(name: 'villa', description: 'villa one', price: '1000')
      expect(Bnb.all).to include 'villa'
    end
  end
end
