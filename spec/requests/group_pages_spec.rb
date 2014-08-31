require 'spec_helper'

describe "Group pages" do
	subject{ page }

	describe "Group page" do
		let(:group) { FactoryGirl.create(:group) }
		before { visit group_path(group) }

		it { should have_title(full_title(group.name)) }
		it { should have_content(group.description) }
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
	end

	describe "creating groups" do
		before { visit new_group_path }

		describe "with invalid information" do

			it "should not create a group" do
				expect{ click_button "Create group" }.not_to change(Group, :count)
			end

			describe "error messages" do
				before { click_button "Create group" }
				it { should have_content('error') }
			end
		end

		describe "with valid information" do

			before do
				fill_in 'group_name', with: "Presenters"
				fill_in 'group_description', with: "Group of presenters"
			end

			it "should create a group" do
				expect{click_button "Create group" }.to change(Group, :count).by(1)
			end
		end
	end
end