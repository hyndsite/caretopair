require 'spec_helper'

describe "AuthenticationPages" do
	subject { page }

	describe "signin page" do
		before { visit signin_path }

		it { should have_title('sign in') }
		it "should have sign in with github link"
		it "should have sign in with bitbucket link"
	end
end
