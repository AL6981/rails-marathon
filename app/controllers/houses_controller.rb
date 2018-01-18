class HousesController < ApplicationController

  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
    @members = @house.members
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)

    if @house.save
      flash[:notice] = "House added successfully"
      redirect_to @house
    else
      render :new
    end
  end

protected

  def house_params
    params.require(:house).permit(:name, :author, :source, :motto)
  end
end
