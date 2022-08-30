class TeamsController < ApplicationController


  def index
    @teams = Team.all.order_by_time_created
  end

  def show
    @team = Team.find(params[:id])
  end

  def new

  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    Team.create(team_params)
    redirect_to '/teams'
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)

    redirect_to "/teams/#{@team.id}"
  end

  private

  def team_params
    params.permit(:name, :currently_leading, :championships_won)
  end

end
