class SessionsController < ApplicationController
	def new
	end

	def create
		File.write(File.join(Rails.root, "authhash.yaml"), request.env['omniauth.auth'].to_yaml)
		auth = request.env["omniauth.auth"]
		identity = Identity.find_by_auth(auth)
	end

	def destroy

	end

end
