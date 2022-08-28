class TeamsController < ApplicationController


  def index
    @teams = Team.all.order_by_time_created
  end

  def show
    @team = Team.find(params[:id])
  end

end
