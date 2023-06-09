class Admin::UsersController < ApplicationController
  before_action :admin_verification

  def admin_verification
    unless current_user.is_admin
      redirect_to root_path
    end
  end

  def destroy
    User.find(params[:id]).delete
    @users = User.all
    redirect_back fallback_location: root_path
  end

end