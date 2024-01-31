require 'sinatra'
require 'bcrypt'
require 'rotp'
require 'sinatra/activerecord'
require 'mail'
require './models/user'

enable :sessions

class TwoFactorAuth < Sinatra::Base
  register Sinatra::ActiveRecordExtension
end

set :database_file, "config/database.yml"
