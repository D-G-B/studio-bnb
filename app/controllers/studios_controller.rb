class StudiosController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show]

  def index
    @studios = Studio.all
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @studios = Studio.where("name ILIKE ?", "%#{@name}%")
    end
  end

  def show
    @studio = Studio.find(params[:id])
  end

  def daw
    @studios = Studio.where(equipment: "Digital Audio workstation")
  end

  def audio_interface
    @studios = Studio.where(equipment: "Audio interface")
  end
  
  def micro
    @studios = Studio.where(equipment: "Microphones")
  end
  
  def monitor
    @studios = Studio.where(equipment: "Monitor")
  end
end
