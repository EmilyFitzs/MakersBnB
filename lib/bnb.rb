require 'pg'

class Bnb
  def self.all
    if ENV['ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    properties = connection.exec('SELECT * FROM properties;')
    properties.map { |row|  
      {"name"=>row['name'], "description"=>row['description'], "price"=>row['price']}
    }
  end

  def self.create(name:, description:, price:)
    if ENV['ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    connection.exec("INSERT INTO properties (name, description, price) VALUES('#{name}', '#{description}', '#{price}')")
  end
end