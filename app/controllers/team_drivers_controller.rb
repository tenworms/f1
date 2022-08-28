class TeamDriversController < ApplicationController

  def index
    @team = Team.find(params[:team_id])
  end

end 
