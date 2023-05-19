class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    if Event.exists? id: params[:id]
      @event = Event.find_by(id: params[:id])

      if @event.validated

      atdees = @event.attendances.all

      @attendees = Array.new

      atdees.each do |a|
        @attendees << User.find_by(id: a.attendee_id)
      end

      if (current_user) then @registred = @event.attendances.all.find_by(attendee_id: current_user.id) end
        
        @author = User.find_by(id: @event.administrator_id)

      else
        redirect_to root_path
      end

    end
    
  end

  def create
    date_time_hash = { "day"=> params["event"]["start_date(3i)"], "month" => params["event"]["start_date(2i)"], "year" => params["event"]["start_date(1i)"] , 
                     "hour" => params["event"]["start_date(4i)"], "minutes" => params["event"]["start_date(5i)"]}

    date_time = DateTime.new(
      date_time_hash["year"].to_i,
      date_time_hash["month"].to_i,
      date_time_hash["day"].to_i,
      date_time_hash["hour"].to_i,
      date_time_hash["minutes"].to_i)

    @event = Event.new(start_date: date_time, title: params["event"][:title], location: params["event"][:location], description: params["event"][:description],
                       price: params["event"][:price].to_i, duration: params["event"][:duration].to_i, administrator_id: current_user.id, validated: false)

    if (@event.save && params["event"][:picture])
        @event.picture.attach(params["event"][:picture])
      flash[:success] = "Evènement crée avec succès !"
      redirect_to root_path
    else
      flash[:alert] = "Erreur lors de la création de l'évènement."
      redirect_back(fallback_location: root_path)
    end

  end

  def join
    @event = Event.find_by(id: params[:id])
    @user = User.find_by(id: @event.administrator_id)
  end

end