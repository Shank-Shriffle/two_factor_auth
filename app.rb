require 'byebug'
require 'sinatra'
require 'bcrypt'
require 'rotp'
require 'sinatra/activerecord'
require 'mail'
require './models/user'
require 'json'

enable :sessions

set :database_file, "config/database.yml"

class TwoFactorAuth < Sinatra::Base
  register Sinatra::ActiveRecordExtension
end

get '/' do
  "Your are on home page"
end

post '/signup' do
  params = JSON.parse(request.body.read)
  email = params['email']
  password = params['password']

  user = User.new(email: email, password: password)
  
  if user.save
    # Send confirmation email part to be implemented here 
    "Registration successful! Confirmation email sent to #{email}"
  else
    "Registration failed: #{user.errors.full_messages.join(', ')}"
  end
end

post '/login' do
  params = JSON.parse(request.body.read)
  email = params['email']
  password = params['password']

  user = User.authenticate(email, password)

  if user
    # Successful login
    session[:user_id] = user.id
    "Login successful for #{email}!"
  else
    "Login failed: Invalid credentials"
  end
end
