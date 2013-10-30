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

class Identity < ActiveRecord::Base
  belongs_to :user, :inverse_of => :identities

  validates :user_id, presence: true
  validates :uid, presence: true
  validates :provider, presence: true

  def self.find_by_auth(auth)
  	find_by_provider_and_uid(auth[:provider], auth[:auth])
  end
end
