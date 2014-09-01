FactoryGirl.define do
	factory :group do
		name				{ Faker::Commerce.department(2) }
		description	{ Faker::Lorem.sentence }
	end
end