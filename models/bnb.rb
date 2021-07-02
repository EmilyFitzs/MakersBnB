require 'pg'
require_relative '../lib/database_connection'
require_relative '../database_connection_setup'

class Bnb
  def self.all
    properties = DatabaseConnection.query('SELECT * FROM properties;')
    properties.map do |row|
      Bnb.new(name: row['name'], description: row['description'], price: row['price'])
    end
  end

  def self.create(name:, description:, price:, availability_start:, availability_end:, user_id:)
    rs = DatabaseConnection.query("INSERT INTO properties(name, description, price, availability_start, availability_end, user_id) VALUES('#{name}', '#{description}', '#{price}', '#{availability_start}', '#{availability_end}', #{user_id}) RETURNING name, description, price;")
    Bnb.new(name: rs[0]['name'], description: rs[0]['description'], price: rs[0]['price'])
  end

  def self.truncate
    DatabaseConnection.query("TRUNCATE TABLE properties CASCADE")
  end

  attr_reader :name, :description, :price

  def initialize(name:, description:, price:)
    @name = name
    @description = description
    @price = price
  end
end
