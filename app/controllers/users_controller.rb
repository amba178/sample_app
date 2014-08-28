class UsersController < ApplicationController
   before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
   before_action :correct_user,   only: [:edit, :update]
   before_action :admin_user,    only: :destroy



  def new
  	@user = User.new
  end
  
  def index
    #@users = User.all
    @users = User.paginate(page: params[:page])
  end

  def show
    #debugger
=begin
    if !session[:omniauth].nil?
       @user = User.find(params[:id]) rescue ""
       @user = User.new
       #debugger
       @user.name = session[:omniauth][:info]['name']
       @user.email =session[:omniauth][:info]['email'] 
       @user.password= "salemali"
       if @user.email.nil?
          @user.email =  "example@gmail.com"
       end
       sign_in @user
    else
       @user = User.find(params[:id])
    end
    session[:omniauth]=nil
=end
   @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    #radebugger
    #session[:omniauth] = nil unless @user.new_record?
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      sign_in(@user)
      redirect_to  user_path(@user)
      #or
      #redirect_to @user
=begin
    elsif !@user.save && !session[:omniauth].nil?
      @user.apply_omniauth(session[:omniauth])
       id = User.all.count + 1
       @user.id = id
       redirect_to user_path(@user)
=end
    else
      render 'new'
    end
  end

  def edit
    #moved to corrent_user
    #@user = User.find( params[:id] )
  end

  def update
    #@user = User.find(params[:id] )
    if @user.update_attributes( user_params )
      #Handle a sucessful update
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private
    #strong parameters
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    #before filter
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end


end
