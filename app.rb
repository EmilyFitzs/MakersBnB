require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './database_connection_setup'
require_relative './models/user'

class Bnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  configure :development do
    register Sinatra::Reloader
  end

  get '/signup' do
    erb :"sessions/sign_up"
  end

  post '/signup' do
   if User.find_column(column_name: "email", value: params[:email])
    flash[:notice] = "A user already exists with this email"
    redirect('/signup')
   elsif params[:password_confirmation] == params[:password]
     user = User.create(email: params[:email], password: params[:password])
     session[:user_id] = user.id
     redirect('/')
   else
    flash[:notice] = "Passwords don't match"
    redirect('/signup')
   end
  end

  get '/' do
    @user = User.find(id: session[:user_id])
    erb :"makersbnb/index"
  end

  get '/signin' do
    erb :"sessions/sign_in"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
    session[:user_id] = user.id
    redirect('/')
    else 
      flash[:notice] = "Username or password is incorrect"
      redirect ('/signin')
    end
  end

  post '/sessions/destroy' do
    session.clear
    redirect('/signin')
  end

  run! if app_file == $0
end