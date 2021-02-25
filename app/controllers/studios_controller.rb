class StudiosController < ApplicationController

  before_action :store_location, :find_studio, only: [ :show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [ :index, :show, :daw, :audio_interface, :micro, :monitor]

  def index
    @studios = policy_scope(Studio)
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @studios = Studio.where("name ILIKE ?", "%#{@name}%")
    end
    @studios = policy_scope(Studio).order(created_at: :desc)
  end

  def show
    @booking = Booking.new
    authorize @studio
  end

  def new
    @studio = Studio.new
    authorize @studio
  end

  def create
    @studio = Studio.new(studio_params)
    authorize @studio
    @studio.user_id = current_user.id
    if @studio.save
      redirect_to studios_path(@studio)
    else
      render :new
    end
  end


    def edit
    end

    def update
      @studio.update(studio_params)
      redirect_to studios_path(@studio)
    end

  def destroy
    authorize @studio
    @studio.destroy
    redirect_to studios_path, notice: 'Your Studio has been deleted!'
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
    authorize @studio
  end

  def studio_params
    params.require(:studio).permit(:name, :address, :equipment, :rate)
  end

end
