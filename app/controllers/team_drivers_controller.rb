class TeamDriversController < ApplicationController

  def index
    @team = Team.find(params[:team_id])
  end

  def new
    @team = Team.find(params[:team_id])
  end

  def create
    @team = Team.find(params[:team_id])
    @team.drivers.create(driver_params)
    redirect_to "/teams/#{@team.id}/drivers"
  end 

private

def driver_params
  params.permit(:name, :up_for_hire, :drivers_age )
end

end
