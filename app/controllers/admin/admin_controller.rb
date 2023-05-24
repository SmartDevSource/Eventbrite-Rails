class Admin::AdminController < ApplicationController
  before_action :admin_verification

  def admin_verification
    unless current_user.is_admin
      redirect_to root_path
    end
  end
  
  def index
    @users = User.all
    @events = Event.all
  end

end