require 'spec_helper'

describe "Static pages" do 

	subject{ page }

	#using shared examples to eliminate duplication
	shared_examples_for "all static pages" do 
		it { should have_selector('h1', text: heading) }
		it { should have_title(full_title(page_title)) }
	end


	describe "Home page" do 
		before { visit root_path}
		let(:heading) { 'Sample App'}
		let(:page_title){''}

		it_should_behave_like "all static pages"
		it { should_not have_title('| Home') }
	end

	describe "Help page" do 
		before { visit help_path }
		let(:heading) { 'Help' }
		let(:page_title) { 'Help' }
		it_should_behave_like 'all static pages'
	end

	describe "About page" do 
		before { visit about_path}
		let(:heading) { 'About' }
		let(:page_title) { 'About' }
		it_should_behave_like 'all static pages'
	end

	describe "Contact page" do 
		before { visit contact_path}
		let(:heading) { 'Contact Us' }
		let(:page_title) { 'Contact Us' }
		it_should_behave_like 'all static pages'
	end
#how to test specific method in controller
describe UsersController, :type => :controller do
	describe "GET new" do
		it "does something" do 
			get :new
			response.should be_successful
		end
	end
end


describe "sign up now link and sample app link" do
		before {visit root_path}
        it "should have the right links for sign up and sample app " do 
			click_link "Sign up now!"
			expect(page).to  have_title(full_title('Sign Up'))
			click_link "sample app"
		    expect(page).to have_title(full_title(' '))
		end
end

	#testing links on the layout
	it "should have the right links on the layout" do
		subject { page }
		visit root_path 
	    click_link "About"
		should have_title(full_title('About Us ')) 
		click_link "Help"
		should have_title(full_title('Help'))
		click_link "Sign in"
		should have_title(full_title(' '))
        click_link "Contact"
		should have_title(full_title('Contact Us'))
	end

end