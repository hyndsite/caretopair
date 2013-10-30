# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  first_name :string(255)
#  last_name  :string(255)
#

require 'spec_helper'

describe User do

	it { should respond_to(:email)}
	it { should respond_to(:first_name)}
	it { should respond_to(:last_name)}

	describe "should be invalid" do
		before {@user = FactoryGirl.build(:user)}
		subject {@user}

		it "when an email is blank" do
			FactoryGirl.build(:user, email: "").should_not be_valid
		end

		describe "when an email" do
			
			it "has invalid format" do
				emails = %w[with@acomma,com
	                  without.atsign.org
	                  withno@ending
	                  with@an_underscore.com
	                  and@has_a+sign.com]

				emails.each do |email|
					@user.email = email
					@user.should_not be_valid
				end
			end
		end

		describe "when an email is duplicated" do
			before do
				user_with_same_email = @user.dup
				user_with_same_email.save
			end

			it {should_not be_valid}
		end

		it "should require at least one identity"	
	end

	describe "shoud be valid" do
		before {@user = FactoryGirl.build(:user)}
		subject {@user}

		it "when email is presisted in lowercase" do
			FactoryGirl.create(:user, email: "UPPER@CASE.COM").email.should_not eq("UPPER@CASE.COM")
		end

		describe "when an email" do
			

			it "has valid format" do
	      emails = %w[one_with-dash@and.underscores.com
	                          UPPER.CASE@ALL.COM
	                          with+signs@inthebeginning.com]
				
				emails.each do |email|
					@user.email = email
					@user.should be_valid
				end
			end
		end

		describe "first and last name is not present" do
			before do
				@user.first_name = nil
				@user.last_name = nil
				@user.save
			end
		
			specify {@user.should_not be_valid}
		end
	end
end
