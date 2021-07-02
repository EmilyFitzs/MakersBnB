require 'bcrypt'
require_relative '../lib/database_connection'

class User
  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES('#{email}', '#{encrypted_password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.all
    results = DatabaseConnection.query('SELECT * FROM users;')
    results.map do |row|
      User.new(id: row['id'], email: row['email'])
    end
  end

  def self.truncate
    puts DatabaseConnection.connection.db
    DatabaseConnection.query("TRUNCATE TABLE users RESTART IDENTITY CASCADE")
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    return unless result.any?
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find_column(column_name:, value:)
    return nil unless value && column_name
    result = DatabaseConnection.query("SELECT * FROM users WHERE #{column_name} = '#{value}'")
    return unless result.any?
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end
end