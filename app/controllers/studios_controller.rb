class StudiosController < ApplicationController
  before_action :find_studio, only: [ :show, :destroy]
  skip_before_action :authenticate_user!, only: [ :index, :show, :destroy, :daw, :audio_interface, :micro, :monitor]

  def index
    @studios = Studio.all
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @studios = Studio.where("name ILIKE ?", "%#{@name}%")
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @studio = Studio.new
  end

  def create
    @studio = Studio.new(studio_params)
    @studio.user_id = current_user.id
    if @studio.save
      redirect_to studios_path(@studio)
    else
      render :new
    end

    def destroy
      @studio.destroy
      redirect_to studios_path, notice: 'Your Studio has been deleted!'
    end
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

private

  def find_studio
    @studio = Studio.find(params[:id])
  end

  def studio_params
    params.require(:studio).permit(:name, :address, :equipment, :rate)
  end

end
