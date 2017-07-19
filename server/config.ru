require './app.rb'
run Sinatra::Application

require('./models/CharacterModel.rb')
require('./models/MembershipModel.rb')
require('./models/OrganizationModel.rb')
require('./models/UserModel.rb')
require('./controllers/CharacterController.rb')
require('./controllers/OrganizationController.rb')
require('./controllers/UserController.rb')




map('/characters') {run CharacterController}
map('/organizations') {run OrganizationController}
map('/users') {run UserController}


# require_relative './controllers/CharacterController.rb'
# require_relative './controllers/OrganizationController.rb'


ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'overwatch'
)