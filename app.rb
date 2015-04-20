require 'bundler'
Bundler.require()

#Connection
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'all_the_chirps'
)
#Models
require './models/chirp'
require './models/user'

#Routes

#All users
get '/api/users' do
  content_type :json
  users = User.all
  users.to_json
end

#A specific user
get '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.to_json
end

#Create a new user
post '/api/users' do
  content_type :json
  user = User.create(params[:user])
  user.to_json
end

#Update an existing user
put '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.update(params[:user])
  user.to_json
end

#Update an existing user
patch '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.update(params[:user])
  user.to_json
end

#Delete an existing user
delete '/api/users/:id' do
  content_type :json
  user = User.delete(params[:id].to_i)
  user.to_json
end

#A specific user's chirps
get '/api/users/:user_id/chirps' do
  content_type :json
  chirps = Chirp.all(params[:user_id].to_i)
  chirps.to_json
end

#A specific user's specific chirp
get '/api/users/:user_id/chirps/:id' do
  content_type :json
  chirps = Chirp.all({user_id:params[:user_id].to_i,id: params[:id].to_i})
  chirps.to_json
end

#Create a Chirp for a user
post '/api/users/:user_id/chirps' do
  content_type :json
  user = User.find(params[:id])
  chirp = Chirp.create(params[:user])
  chirp.to_json
end

#Update a user's existing chirp
put '/api/users/:user_id/chirps/:id' do
  content_type :json
  user = User.find(params[:id])
  chirp.update(params[:chirp])
  chirp.to_json
end

#Update a user's existing chirp
patch '/api/users/:user_id/chirps/:id' do
  content_type :json
  user = User.find(params[:id])
  chirp.update(params[:chirp])
  chirp.to_json
end

#Delete a user's existing chirp
delete '/api/users/:user_id/chirps/:id' do
  content_type :json
  user = User.delete(params[:chirp].to_i)
  user.to_json
end
