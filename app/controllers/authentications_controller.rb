class AuthenticationsController < ApplicationController
  def index
  	#if the current_user exist get the authentication options
  	@authentications = current_user.authentications if current_user
  end

  def create
  	omniauth = request.env['omniauth.auth']
  	authentication = Authentication.find_by_provider_and_uid(omniauth['provider'],
  	                                                               omniauth['uid'])
  	if authentication
  		user = authentication.user
  		sign_in(user)
  		flash[:notice] = "Signed in successfully"
  		redirect_to user
  	elsif current_user
		current_user.authentications.create!(:provider => omniauth['provider'], 
			                                         :uid => omniauth['uid'] )
		flash[:notice] = "Authentication successfully"
		redirect_to authentications_path
	else
		@user = User.new
		@user.apply_omniauth(omniauth)
		if @user.save
			sign_in(@user)
	  		flash[:notice] = "Signed in successfully"
	  		redirect_to @user
	  	else
	  		session[:omniauth] = omniauth.except('extra')
	  		redirect_to new_user_path
	  	end
  	end
  end

  def destroy
  	@authentication = current_user.authentications.find(params[:id])
  	@authentication.destroy
  	flash[:notice] = "successfully destroyed authentication."
  	redirect_to authentications_path
  end
end
