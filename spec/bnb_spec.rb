require 'bnb'

describe Bnb do
  describe '.all' do
    it 'returns a list of properties' do
      connection = PG.connect(dbname: 'makersbnb_test')
      Bnb.truncate
      properties = Bnb.create(name: 'house', description: 'h', price: '3000')
      Bnb.create(name: 'boat', description: 'b', price: '400')
      Bnb.create(name: 'houseboat', description: 'hb', price: '600')
      properties = Bnb.all
      expect(properties.length).to eq 3
      expect(properties.first.name).to eq 'house'
      expect(properties.first.description).to eq 'h'
      expect(properties.first.price).to eq '3000'


      # connection.exec("INSERT INTO properties (name, description, price) VALUES('room one', 'king', '75');")
      # connection.exec("INSERT INTO properties (name, description, price) VALUES('room two', 'queen', '67');")
      # properties = Bnb.all
      # expect(properties).to include('Name: room one Description: king Price: 75')
      # expect(properties).to include('Name: room two Description: queen Price: 67')
    end
  end

  describe '.create' do
    it 'creates a new properties' do
      properties = Bnb.create(name: 'room60', description: 'the sixtieth room', price: '6000')

      expect(properties).to be_a Bnb
      expect(properties.name).to eq 'room60'
      expect(properties.description).to eq 'the sixtieth room'
      expect(properties.price).to eq '6000'
    end
  end
end


