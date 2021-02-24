class BookingsController < ApplicationController
  before_action :find_studio, only: [ :new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.studio = @studio
    @booking.user = current_user
    @booking.total_price = @studio.rate * total_hours
    if @booking.save
      redirect_to studio_path(@studio), notice: 'Your booking has been saved!'
    else
      redirect_to studio_path(@studio), notice: 'Please try again!'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to studio_path(@booking.studio), notice: 'Your booking has been deleted!'
  end


  private

  def booking_params
    params.require(:booking).permit(:end_date, :start_date)
  end
  
  def find_studio
    @studio = Studio.find(params[:studio_id])
  end

  def total_hours
   ((@booking.end_date - @booking.start_date) / 3600).to_i
  end
end


