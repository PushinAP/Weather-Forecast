class ForestcastWeathersController < ApplicationController

  def index
    @weathers = ForecastWeather.all
  end

  def show
  	@weather = ForecastWeather.find(params[:id])
  end

  def new
    @weather = ForecastWeather.new
  end

  def create
  	@weather = ForecastWeather.new(article_params)

  	if @weather.save
  	  redirect_to forestcast_weathers_path
    else
      render 'new'
    end
  end

	def destroy
    @weather = ForecastWeather.find(params[:id])
    @weather.destroy
 
    redirect_to forestcast_weathers_path
  end

  private 

  	def article_params
  	  params.require(:article).permit(:citi_id, :citi_name)
    end
end
