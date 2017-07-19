class CharacterController < Sinatra::Base

	options '*' do
		response['Access-Control-Allow-Origin'] = '*'
		response['Access-Control-Allow-Headers'] = 'content-type'
		response['Access-Control-Allow-Methods'] = 'GET,POST,PATCH,DELETE'
		200
	end

	get '/' do
		response['Access-Control-Allow-Origin'] = '*'
		response['Access-Control-Allow-Header'] = 'content_type'
		content_type :json
		characters = Character.all
		# organizations = []
		# characters.each do |character|
		# 	organizations.push(character.organizations)
		# end
		# [{'characters': characters, 'organizations': organizations}].to_json	
		p characters
		characters.to_json
end

	get '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		id = params[:id]
		character = Character.find(id)
		organizations = character.organizations
		{character: character, organization: organizations}.to_json
	end

	post '/' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		request_body = JSON.parse(request.body.read)
		new_character = Character.new(request_body)
		new_character.save
		new_character.to_json
	end


	patch '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		id = params[:id]
		character = Character.find(id)
		request_body = JSON.parse(request.body.read)
		character.update_attributes(request_body)
		character.save
		characters = Character.all
		characters.to_json
	end


	delete '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		id = params[:id]
		character = Character.find(id)
		character.destroy
		characters = Character.all
		characters.to_json
	end
end