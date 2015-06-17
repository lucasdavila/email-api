require 'active_record'
require 'yaml'

def establish_db_connection!
  ActiveRecord::Base.establish_connection config[env]
end

def config
  YAML.load_file "config/database.yml"
end

def env
  ENV['RACK_ENV'] ? ENV['RACK_ENV'] : 'development'
end

establish_db_connection!
