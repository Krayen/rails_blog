class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  


  private
  def user_params
    params.reqire(:user).permit(:email, :password)
  end
end
