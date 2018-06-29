class CitiesController < ApplicationController
	def index
    @cities = City.all
  end

  def show
  	city = City.find(params[:id])
    @weather = get_weather_forecast(city.city_id)
  end

  def new
    @city = City.new
  end

  def create
  	@city = City.new(cities_params)

  	if @city.save
  	  redirect_to cities_path
    else
      render 'new'
    end
  end

	def destroy
    @city = City.find(params[:id])
    @city.destroy
 
    redirect_to forestcast_weathers_path
  end

  private 

  	def cities_params
  	  params.require(:city).permit(:city_id, :city_name)
    end
end
