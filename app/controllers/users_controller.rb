class UsersController < ApplicationController
  def show
    if !User.exists? id: params[:id]
      redirect_to root_path
    else
      @user= User.find(params[:id])
    end
  end
end
