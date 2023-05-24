class Admin::EventsController < ApplicationController
  before_action :admin_verification

  def admin_verification
    unless current_user.is_admin
      redirect_to root_path
    end
  end

  def create
    Event.find(params[:id]).update(validated: true)
    puts "lol"
    redirect_back fallback_location: root_path
  end

  def destroy
    Event.find(params[:id]).delete
    @events = Event.all
    redirect_back fallback_location: root_path
  end

end