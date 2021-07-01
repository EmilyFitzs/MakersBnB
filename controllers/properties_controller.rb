class SpaceController < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  configure :development do
    register Sinatra::Reloader
  end

set :views, Proc.new { File.join(APP_ROOT, "views") }

get '/properties/add' do
  check_authenticated(session: session)
  erb :add_property
end

post '/properties/add' do
  current_user = check_authenticated(session: session)
  @bnb = Bnb.create(name: params[:name],
                    description: params[:description],
                    price: params[:price],
                    availability_start: params[:availability_start],
                    availability_end: params[:availability_end],
                    user_id: current_user.id)
      redirect '/properties'
end

get '/properties' do
  check_authenticated(session: session)
  @properties = Bnb.all
  erb(:properties)
end
end