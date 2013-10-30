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

class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	
	has_many :identities, :inverse_of => :user

	validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_FORMAT}
	validates :first_name, presence: true
	validates :last_name, presence: true
end
