class OrganizationController < Sinatra::Base

	get '/' do
		organizations = Organization.all
		organizations.to_json
	end

	post '/' do
		request_body = JSON.parse(request.body.read)
		new_organization = Organization.new(request_body)
		new_organization.save
		new_organization.to_json
	end

	patch '/:id' do
		id = params[:id]
		organization = Organizations.find(id)
		request_body = JSON.parse(request.body.read)
		organization.update_attributes(request_body)
		organization.save
		organization.to_json
	end

	delete '/:id' do
		id = params[:id]
		organization = Organization.find(id)
		organization.destroy
		organizations = Organization.all
		organizations.to_json
	end

end