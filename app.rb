require 'sinatra/base'
# require 'shotgun'

# configure(:development) { set :session_secret, 'super secret' }

class Battle < Sinatra::Base
  get '/' do
    "Testing infrastructure working!"
  end

  get '/' do
    erb(:index)
  end
  
  post '/names' do
    @player_1_name = params[:player_1_name]
    @player_2_name = params[:player_2_name]
    erb(:play)
  end

  run! if app_file ==$0
end
