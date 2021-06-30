require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bnb'

class MakersBnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/properties' do
    @properties = Bnb.all
    erb :properties
  end

  get '/properties/add' do
    erb :add_property
  end

  post '/properties/add' do
    Bnb.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/properties'
  end


  run! if app_file == $0
end