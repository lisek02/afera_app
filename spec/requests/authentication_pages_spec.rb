require 'spec_helper'

describe "Authentication" do
	subject { page }

	describe "signig page" do
		before { visit signin_path }

		it { should have_title('Sign in') }
		it { should have_content('Sign in') }
	end
end
