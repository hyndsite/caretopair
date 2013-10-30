require 'spec_helper'
require 'yaml'

describe SessionsController do
	describe "#create" do
		before do
			request.env["omniauth.auth"] = OmniAuth.config.add_mock(:github, {uid: '111999'})
		end

		it "d" do
		  auth = request.env['omniauth.auth']
		  puts auth[:uid]
		end
	end
end
