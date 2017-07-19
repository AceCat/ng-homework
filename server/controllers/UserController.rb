require 'SecureRandom'

class UserController < Sinatra::Base

	get '/users' do
		users = User.all
		users.to_json
	end

	post '/register' do
		user_details = JSON.parse(request.body.read)
		user = User.new(user_details)
		user.token = SecureRandom.hex
		p user
		user.save
		user.to_json
	end

	post '/login' do
		user_details = JSON.parse(request.body.read)
		user = User.find_by({email: user_details["email"]})
		if user && user.authenticate(user_details["password"])
			"Access granted"
			else
			"Incorrect username or password"
		end
	end

end