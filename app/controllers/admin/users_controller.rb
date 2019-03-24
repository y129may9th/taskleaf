class Admin::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to admin_users_path, notice: "Registerd #{@user.name} !!😍" 
    else
        render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to admin_user_path(@user), notice: "Update #{@user.name} !! 🙆🏻‍♀️"
    end
  end


  private 

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

end
