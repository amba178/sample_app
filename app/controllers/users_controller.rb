class UsersController < ApplicationController


  def new
  	@user = User.new
  end

  def show
    #debugger
    if !session[:omniauth].nil?
       @user = User.find(params[:id]) rescue ""
       @user = User.new
       #debugger
       @user.name = session[:omniauth][:info]['name']
       @user.email =session[:omniauth][:info]['email'] 
       if @user.email.nil?
          @user.email =  "example@gmail.com"
       end
    else
       @user = User.find(params[:id])
    end
    session[:omniauth]=nil
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
    elsif !@user.save && !session[:omniauth].nil?
      @user.apply_omniauth(session[:omniauth])
       id = User.all.count + 1
       @user.id = id
       redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find( params[:id] )
  end

  def update
    @user = User.find(params[:id] )
    if @user.update_attributes( user_params )
      #Handle a sucessful update
    else
      render 'edit'
    end
  end

  private
    #strong parameters
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end


end
