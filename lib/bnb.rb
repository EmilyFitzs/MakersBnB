require 'pg'
require_relative 'database_connection'
require './database_connection_setup'

class Bnb
  def self.all
    if ENV['ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    properties = connection.exec('SELECT * FROM properties;')
    properties.map do |row|
      Bnb.new(name: row['name'], description: row['description'], price: row['price'])
    end
    # { |row|  
    #   {'name: '=>row['name'], 'description: '=>row['description'], 'price: '=>row['price']}
    # }
  end

  def self.create(name:, description:, price:)
    if ENV['ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    rs = connection.exec("INSERT INTO properties (name, description, price) VALUES('#{name}', '#{description}', '#{price}') RETURNING name, description, price;")
    Bnb.new(name: rs[0]['name'], description: rs[0]['description'], price: rs[0]['price'])
  end

  def self.truncate
    DatabaseConnection.query("TRUNCATE TABLE properties")
  end

  attr_reader :name, :description, :price

  def initialize(name:, description:, price:)
    @name  = name
    @description = description
    @price = price
  end

end
