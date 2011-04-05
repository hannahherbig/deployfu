require 'sinatra'
require 'sequel'

configure :development do
  DB = Sequel.sqlite
end

configure :production do
  DB = Sequel.connect(:adapter  => 'mysql2',
                      :host     => ENV['DEPLOYFU_MYSQL_HOST'],
                      :user     => ENV['DEPLOYFU_MYSQL_USER'],
                      :password => ENV['DEPLOYFU_MYSQL_PASSWORD'],
                      :database => ENV['DEPLOYFU_MYSQL_DATABASE'])
end

get '/' do
  'Hello from Sinatra on DeployFu!'
end
