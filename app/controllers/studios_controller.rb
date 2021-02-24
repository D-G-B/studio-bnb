class StudiosController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show]

  def index
    @studios = Studio.all
  end

  def show
    @studio = Studio.find(params[:id])
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
  end

private

  def studio_params
    params.require(:studio).permit(:name, :address, :equipment, :rate)
  end

end
