class PlantsController < ApplicationController
  before_action :set_plant, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @plants = Plant.all
  end

  def show

  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @plant.update(plant_params)
    redirect_to plant_path(@plant)
  end

  def destroy
    @plant.destroy
    redirect_to dashboard_path
  end

  private

  def plant_params
    params.require(:plant).permit(:title, :description, :category, :price_per_day, :photo)
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end
end
