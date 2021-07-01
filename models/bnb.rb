require 'pg'
require_relative '../lib/database_connection'
require_relative '../database_connection_setup'

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

  def self.create(name:, description:, price:, availability_start:, availability_end:, user_id:)
    if ENV['ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    rs = connection.exec("INSERT INTO properties (name, description, price, availability_start, availability_end, user_id) VALUES('#{name}', '#{description}', '#{price}', '#{availability_start}', '#{availability_end}', #{user_id}) RETURNING name, description, price;")
    Bnb.new(name: rs[0]['name'], description: rs[0]['description'], price: rs[0]['price'])
  end

  def self.truncate
    drop_command = DatabaseConnection.query("SELECT 'ALTER TABLE "'||nspname||'"."'||relname||'" DROP CONSTRAINT "'||conname||'";'
    FROM pg_constraint 
    INNER JOIN pg_class ON conrelid=pg_class.oid 
    INNER JOIN pg_namespace ON pg_namespace.oid=pg_class.relnamespace 
    ORDER BY CASE WHEN contype='f' THEN 0 ELSE 1 END,contype,nspname,relname,conname")
    recreate_command = DatabaseConnection.query("SELECT 'ALTER TABLE "'||nspname||'"."'||relname||'" ADD CONSTRAINT "'||conname||'" '||
    pg_get_constraintdef(pg_constraint.oid)||';'
    FROM pg_constraint
    INNER JOIN pg_class ON conrelid=pg_class.oid
    INNER JOIN pg_namespace ON pg_namespace.oid=pg_class.relnamespace
    ORDER BY CASE WHEN contype='f' THEN 0 ELSE 1 END DESC,contype DESC,nspname DESC,relname DESC,conname DESC;")
    p drop_command
    p recreate_command
    DatabaseConnection.query("TRUNCATE TABLE properties CASCADE")
  end

  attr_reader :name, :description, :price

  def initialize(name:, description:, price:)
    @name  = name
    @description = description
    @price = price
  end

end
