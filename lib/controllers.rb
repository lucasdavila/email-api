require './lib/controllers/base_controller'
Dir['./lib/controllers/*.rb'].each { |file| require file }
