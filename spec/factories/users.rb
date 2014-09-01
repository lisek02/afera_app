FactoryGirl.define do
	factory :user do
		login	{ Faker::Internet.user_name }
		email			{ Faker::Internet.email }
		password	{ Faker::Internet.password }

		factory :admin do
			admin		true
		end
	end
end