require 'spec_helper'

describe "Group pages" do
	subject{ page }

	describe "Group page" do
		let(:group) { FactoryGirl.create(:group) }
		let(:user) { FactoryGirl.create(:user) }
		before do
			group.users << user
			visit group_path(group)
		end

		it { should have_title(full_title(group.name)) }
		it { should have_content(group.description) }
		it { should have_content(group.users.first.login)}
	end

	describe "index" do
		before do
			FactoryGirl.create(:group)
			FactoryGirl.create(:group, name: "producer", description: "Group of producers" )
			FactoryGirl.create(:group, name: "culture redactor", description: "Group of culture redactors")
			visit groups_path
		end

		it { should have_title('All groups') }
		it { should have_content('All groups') }

		it "should list all groups" do
			Group.all.each do |group|
				expect(page).to have_selector('li', text: group.name)
			end
		end

		describe "delete and edit links" do

			it { should_not have_link('delete') }
			it { should_not have_link('edit') }

			describe "as admin user" do
				let(:admin) { FactoryGirl.create(:admin) }
				before do
					sign_in admin
					visit groups_path
				end

				it { should have_link('delete', href: group_path(Group.first)) }
				it "should be able to delete another group" do
					expect { click_link('delete', match: :first) }.to change(Group, :count).by(-1)
				end

				it { should have_link('edit', href: edit_group_path(Group.first)) }
				it "should be able to edit group" do
					click_link('edit', match: :first)
					expect(page).to have_content('Edit group')
				end
			end
		end
	end

	describe "creating groups" do
		before { visit new_group_path }

		describe "with invalid information" do

			it "should not create a group" do
				expect{ click_button "Save" }.not_to change(Group, :count)
			end

			describe "error messages" do
				before { click_button "Save" }
				it { should have_content('error') }
			end
		end

		describe "with valid information" do

			before do
				fill_in 'group_name', with: "Presenters"
				fill_in 'group_description', with: "Group of presenters"
			end

			it "should create a group" do
				expect{click_button "Save" }.to change(Group, :count).by(1)
			end
		end
	end
end