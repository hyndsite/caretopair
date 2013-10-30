require 'spec_helper'

describe "User Pages" do
  subject { page }

  describe "signup page" do
		before { visit signup_path }
		
		it "should have base title" do
			should have_title("")
		end

		it { should have_title("sign up") }
		it "have content sign up"
		it "has a link to bitbucket"

  end
end
