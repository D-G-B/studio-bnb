class StudiosController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show]

  def index
    @studios = Studio.all
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @studios = Studio.where(name: @name)
    end
  end

  def show
    @studio = Studio.find(params[:id])
  end
end
