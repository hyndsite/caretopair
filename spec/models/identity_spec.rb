# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  uid        :string(255)
#  provider   :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Identity do
	before do 
		@identity = Identity.new
		@user = FactoryGirl.create(:user)
	end
	subject { @identity } 

	it {should respond_to(:uid)}
	it {should respond_to(:provider)}
	it {should respond_to(:user_id)}

	specify {@identity.should have(1).error_on(:user_id)}
	specify {@identity.should have(1).error_on(:uid)}
	specify {@identity.should have(1).error_on(:provider)}

	describe "is valid when all requirements are met" do
		before do
			@identity = FactoryGirl.create(:github, user: @user)
			@identity.user = @user
			@identity.save
		end
		it "test" do
			@user.id
		end
		it {should be_valid}
	end

	it "when user is not present" do
		FactoryGirl.build(:github, user: nil).should_not be_valid
	end

	describe "can use find_by_auth to locate existing identity" do
		before do
			@uid = '1111999'
			@provider = 'github'
			@auth = {uid: @uid, provider: @provider}
		end
		subject {@auth}
		let(:identity) {@identity = FactoryGirl.create(:github, uid: @uid, provider: @provider)}
		
		it {Identity.find_by_auth(@auth).should eq(identity)}
	end
end
