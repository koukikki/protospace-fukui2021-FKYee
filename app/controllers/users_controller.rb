class UsersController < ApplicationController

  def new 
   @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :profile, :affiliation, :post, :email, :password, :password_confirmation))
    @user.save
    redirect_to root_path
  end

end
