require 'spec_helper'

describe "User pages" do
	subject{ page }

	describe "Sign up page" do
		before { visit signup_path }
		it { should have_title('Sign up') }
		it { should have_content('Sign up') }
	end

	describe "User page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_title(full_title(user.login)) }
		it { should have_content(user.login) }
	end
end
