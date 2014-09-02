require 'spec_helper'

describe "User pages" do
	subject{ page }

	describe "User page" do
		let(:user) { FactoryGirl.create(:user) }
		let(:group) { FactoryGirl.create(:group) }
		before do
			user.groups << group
			visit user_path(user)
		end

		it { should have_title(full_title(user.login)) }
		it { should have_content(user.login) }
		it { should have_content(user.groups.first.name)}
	end

	describe "Sign up page" do
		before { visit signup_path }
		it { should have_title('Sign up') }
		it { should have_content('Sign up') }
	end

	describe "signup" do

		before { visit signup_path }
		let(:submit) { "Create my account" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end

			describe "after submision" do
				before { click_button submit }

				it { should have_title('Sign up') }
				it { should have_content('error') }
			end
		end

		describe "with valid information" do
			before do
				fill_in 'Login', with: 'user'
				fill_in 'Email', with: 'user@example.com'
				fill_in 'Password', with: 'foobar'
				fill_in 'Confirmation', with: 'foobar'
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving the user" do
				before { click_button submit }
				let(:user) { User.find_by_email("user@example.com") }

				it { should have_title(user.login) }
				it { should have_link('Sign out')}
				it { should have_selector('div.alert', text: 'Welcome') }
			end
		end
	end

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			sign_in(user)
			visit edit_user_path(user)
		end

		describe "page" do
			it { should have_content("Update profile") }
			it { should have_title("Edit user") }
			it { should have_link('change', href: 'http://gravatar.com/email') }
		end

		describe "with invalid information" do
			before { click_button "Save changes" }

			it { should have_content('error') }
		end

		describe "with valid information" do
			let(:new_login) { "login" }
			let(:new_email) { "new@example.com" }
			before do
				fill_in "Login",									with: new_login
				fill_in "Email",									with: new_email
				fill_in "Password",								with: user.password
				fill_in "Password Confirmation", 	with: user.password
				click_button "Save changes"
			end

			it { should have_title(new_login) }
			it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
			specify { expect(user.reload.login).to eq new_login }
			specify { expect(user.reload.email).to eq new_email }
		end
	end

	describe "visiting index as admin user" do
		before do
			sign_in FactoryGirl.create(:admin)
			FactoryGirl.create(:user, login: "bob", email: "bob@example.com" )
			FactoryGirl.create(:user, login: "ben", email: "ben@example.com")
			visit users_path
		end

		it { should have_title('All users') }
		it { should have_content('All users') }

		it "should list each user" do
			User.all.each do |user|
				expect(page).to have_selector('li', text: user.login)
			end
		end

		describe "should have edit and delete links" do

			it { should have_link('delete', user_path(User.first)) }
			it "should be able to delete another user" do
				expect { click_link('delete', match: :first).to change(User, :count).by(-1) }
			end

			it { should have_link('edit', edit_user_path(User.first)) }
			it "should be able to edit user" do
				click_link('edit', match: :first)
				expect(page).to have_content('Update profile')
			end
		end
	end
end
