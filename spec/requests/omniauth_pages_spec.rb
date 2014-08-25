require 'spec_helper'

describe "OmniauthPages" do

	subject{page}

  describe "index page" do
  	before{ visit authentications_url}

  	it { should have_title(full_title('Authentication')) }

  	describe "when you are on / or any other page" do
       before{ visit root_url }
  	   it { should have_link("Other options",  href: authentications_path) }
  	end


  end
    
end
