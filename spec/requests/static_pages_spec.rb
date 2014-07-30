require 'spec_helper'

describe "Static pages" do

	let(:base_title) { "Radio Afera" }

	describe "Home page" do

		it "should have content 'Afera App'" do
			visit '/static_pages/home'
			expect(page).to have_content('Afera App')
		end

		it "should have title base title" do
			visit '/static_pages/home'
			expect(page).to have_title("#{base_title}")
		end
	end

	describe "Music page" do

		it "should have content 'Music'" do
			visit '/static_pages/music'
			expect(page).to have_content('Music')
		end

		it "should have title 'Muzyka'" do
			visit '/static_pages/music'
			expect(page).to have_title("#{base_title} | Muzyka")
		end
	end

	describe "About page" do

		it "should have content 'About Us'" do
			visit '/static_pages/about'
			expect(page).to have_content('About Us')
		end

		it "should have title 'O nas'" do
			visit '/static_pages/about'
			expect(page).to have_title("#{base_title} | O nas")
		end
	end

	describe "Contact page" do

		it "should have content 'Contact'" do
			visit '/static_pages/contact'
			expect(page).to have_content('Contact')
		end

		it "should have title 'Kontakt'" do
			visit '/static_pages/contact'
			expect(page).to have_title("#{base_title} | Kontakt ")
		end
	end
end
