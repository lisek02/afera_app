FactoryGirl.define do
	factory :user do
		login			"example"
		email			"user@example.com"
		password	"foobar"
		password_confirmation	"foobar"
	end
end