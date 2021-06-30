require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('makersbnb')
else
  DatabaseConnection.setup('makersbnb_test')
end