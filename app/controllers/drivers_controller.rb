class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def edit
    @driver = Driver.find(params[:id])
  end
  
  def update
    @driver = Driver.find(params[:id])
    @driver.update(driver_params)

    redirect_to "/drivers/#{@driver.id}"
  end
private

  def driver_params
    params.permit(:name, :up_for_hire, :drivers_age)
  end
end
