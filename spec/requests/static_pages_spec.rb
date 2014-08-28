require 'spec_helper'

describe "Static pages" do

	subject { page }

	shared_examples_for "all static pages" do
		it { should have_selector('h1', text: heading) }
		it { should have_title(full_title(page_title)) }
	end

	describe "Home page" do
		before { visit root_path }

		let(:heading) { 'Afera App' }
		let(:page_title) { '' }

		it_should_behave_like "all static pages"
		it { should_not have_title('| Home')}
	end

	describe "Music page" do
		before { visit music_path }

		let(:heading) { 'Muzyka' }
		let(:page_title) { 'Muzyka' }	

		it_should_behave_like "all static pages"
	end

	describe "About page" do
		before { visit about_path }

		let(:heading) { 'O nas' }
		let(:page_title) { 'O nas' }

		it_should_behave_like "all static pages"
	end

	describe "Contact page" do
		before { visit contact_path }

		let(:heading) { 'Kontakt' }
		let(:page_title) { 'Kontakt' }

		it_should_behave_like "all static pages"
	end

	it "should have the right links on the layout" do
		visit root_path
		click_link "Home"
		expect(page).to have_title(full_title(''))
		click_link "Muzyka"
		expect(page).to have_title(full_title('Muzyka'))
		click_link "O nas"
		expect(page).to have_title(full_title('O nas'))
		first(:link, "Kontakt").click
		expect(page).to have_title(full_title('Kontakt'))
	end
end
