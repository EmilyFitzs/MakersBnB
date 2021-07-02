ENV['RACK_ENV'] ||= 'development'
APP_ROOT = File.dirname(__FILE__)

require 'sinatra/base'
require 'sinatra/reloader'
require_relative './models/bnb'

require 'sinatra/flash'
require_relative './database_connection_setup'
require_relative './models/user'
require_relative 'helpers'


require_relative 'controllers/user_controller'
require_relative 'controllers/properties_controller'

class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  configure :development do
    register Sinatra::Reloader
  end

  use UserController
  use SpaceController
  # start the server if ruby file executed directly
  run! if app_file == $0

end