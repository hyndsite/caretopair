FactoryGirl.define do
	factory :user do
		sequence(:first_name) {|n| "Person#{n}first"}
		sequence(:last_name) {|n| "Person#{n}last"}
		sequence(:email)	{|n| "my#{n}@example.com"}
	end

	factory :identity do
		factory :github do
			uid Random.rand(100000)
			provider "github"
			user
		end
	end
end