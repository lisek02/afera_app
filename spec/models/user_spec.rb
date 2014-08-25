require 'spec_helper'

describe User do
	
	before { @user = User.new(login: "example", email: "user@example.com") }

	subject { @user }

	it { should respond_to(:login) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }

	it { should be_valid }

	describe "when login is not present" do
		before { @user.login = " " }
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
		it "should be invalid" do
			adresses = %w[user@foo,com user_at_foo.org, example.user@foo
									foo@bar_baz.com foo@bar+baz.com]
			adresses.each do |invalid_adress|
				@user.email = invalid_adress
				expect(@user).not_to be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
			adresses = %w[user@foo.COM A_US_ER@f.b.org first.lst@foo.jp a+b@baz.com]
			adresses.each do |valid_adress|
				@user.email = valid_adress
				expect(@user).to be_valid
			end
		end
	end

	describe "when email address id already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it { should_not be_valid }
	end
end
