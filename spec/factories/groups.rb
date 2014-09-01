FactoryGirl.define do
	factory :group do
		name				{ "Prezenterzy" }
		description	{ Faker::Lorem.sentence }
	end
end