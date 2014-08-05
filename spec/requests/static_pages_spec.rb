require 'spec_helper'

describe "Static pages" do 

	let(:base_title){"Ruby on Rails Tutorial Sample App "}
	subject{page}
	describe "Home page" do 
		before { visit root_path}
		it "should have the content 'Sample App'" do 
			#visit '/static_pages/home'
			#visit root_path
			#expect(page).to have_content('Sample App')
			should have_content('Sample App')

		end

		it "should have title 'Home" do 
			#visit '/static_pages/home'
			#visit root_path
			#expect(page).to have_title("#{base_title} | Home")
			should have_title(full_title(''))
		end
	end

	describe "Help page" do 
		before { visit help_path }
		it "should have the content 'Help'" do 
			#visit help_path
			#expect(page).to have_content('Help')
			should have_content('Help')
		end

		it "should have title 'Help" do 
			#visit '/static_pages/help'
			#visit help_path
			#expect(page).to have_title("#{base_title}| Help")
			#should have_title("#{base_title}| Help")
			should have_title(full_title('Help'))
		end
	end

	describe "About page" do 
		before { visit about_path}
		it "should have the content 'About Us'" do 
			#visit '/static_pages/about'
			#visit about_path
			#expect(page).to have_content('About Us')
			should have_content('About Us')
		end

		it "should have title 'About" do 
			#visit '/static_pages/about'
			#visit about_path
			#expect(page).to have_title("#{base_title}| About")
			#should have_title("#{base_title} | About")
			should have_title(full_title('About'))
		end
	end

	describe "Contact page" do 
		before { visit contact_path}
		it "should have the content 'Contact Us'" do 
			#visit '/static_pages/contact'
			#visit contact_path
			#expect(page).to have_content('Contact Us')
			should have_content('Contact Us')
		end

		it "should have title 'Contatc Us'" do 
			#visit '/static_pages/contact'
			#visit contact_path
			#expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contact Us")
			#should have_title("Ruby on Rails Tutorial Sample App | Contact Us")
			should have_title(full_title('Contact Us'))
		end
	end

end