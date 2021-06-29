require 'sinatra/base'
require 'sinatra/reloader'

class Bnb < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('/makersbnb')
  end

  run! if app_file == $0
end