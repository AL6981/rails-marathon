class MembersController < ApplicationController

  def index
    @house = House.find(params[:house_id])
    @members = @house.members
  end

  def new
    @house = House.find(params[:house_id])
    @member = Member.new
  end

  def create
    @house = House.find(params[:house_id])
    @member = Member.create(member_params)
    @member.house = @house

    if @member.save
      flash[:notice] = "Member added successfully"
      redirect_to @house
    else
      render :new
    end
  end

  protected

  def member_params
    params.require(:member).permit(:first_name, :last_name, :created_at, :house_id)
  end
end
