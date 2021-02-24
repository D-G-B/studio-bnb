class StudiosController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show]

  def index
    @studios = Studio.all
  end

  def show
    @studio = Studio.find(params[:id])
    @booking = Booking.new
  end

  def new
    @studio = Studio.new
  end

  def create

  end

  
end
