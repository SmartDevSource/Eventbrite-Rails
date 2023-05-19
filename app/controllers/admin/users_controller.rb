class Admin::UsersController < ApplicationController
  before_action :admin_verification

  def index

  end

  def admin_verification
    unless current_user.is_admin
      redirect_to root_path
    end
  end

end