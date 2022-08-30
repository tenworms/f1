class TeamsController < ApplicationController


  def index
    @teams = Team.all.order_by_time_created
  end

  def show
    @team = Team.find(params[:id])
  end

  def new

  end

  def create
    Team.create(team_params)
    redirect_to '/teams'
  end

  private

  def team_params
    params.permit(:name, :currently_leading, :championships_won)
  end

end
