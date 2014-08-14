class AuthenticationsController < ApplicationController
  def index
  	@authentications = current_user.authentications if current_user
  	@auth_footer = 'auth_footer'
  end

  def create
  	#to inspect the hash returned from twitter
  	#render :text => request.env['omniauth.auth'].to_yaml
    auth = request.env['omniauth.auth']

    #create bugs for many login notification
  	#current_user.authentications.create(:provider => auth['provider'], :uid => auth['uid'])
    current_user.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
  	flash.now[:notice] = "Authentication successfull"
  	redirect_to authentications_path
  end

  def destroy
  	@authentication = current_user.authentications.find(params[:id])
  	@authentication.destroy
  	flash[:notice]="Successfully destroyed authentication."
  	redirect_to authentications_path
  end
end
