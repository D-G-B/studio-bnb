class StudiosController < ApplicationController

  before_action :store_location, :find_studio, only: [ :show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [ :index, :show, :daw, :audio_interface, :micro, :monitor]

  def index
    #Pundit
    @studios = policy_scope(Studio)
    @studios = policy_scope(Studio).order(created_at: :desc)
    #Searchbar
    if params[:query].present?
      sql_query = "name ILIKE :query OR equipment ILIKE :query OR address ILIKE :query"
    @studios = Studio.where(sql_query, query: "%#{params[:query]}%")
    else
      @movies = Studio.all
    end
  end

  def show
    @user = current_user
    @bookings = policy_scope(Booking).order(created_at: :desc).where(user_id: @user)
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
      redirect_to studio_path(@studio)
    else
      render :new
    end
  end


    def edit
    end

    def update
      authorize @studio
      @studio.update(studio_params)
      redirect_to studio_path(@studio)
    end

  def destroy
    authorize @studio
    @studio.destroy
    redirect_to studios_path, notice: 'Your Studio has been deleted!'
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
