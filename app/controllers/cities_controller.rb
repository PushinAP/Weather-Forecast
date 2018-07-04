class CitiesController < ApplicationController
  before_action :checking_authorization
  before_action :checking_current_user_admin, only:[:create, :destroy, :new]

	def index

    @cities = City.all

  end

  def show

  	city = City.find(params[:id])
    @weather = caching_weather_forecast(city.city_id)

  end

  def new

    @city = City.new

  end

  def create

  	@city = City.new(cities_params)

    if @city.save
      redirect_to cities_path
    else 
      flash[:danger] = 'This city was add'
      render 'new'
    end
  end

	def destroy

    @city = City.find(params[:id])

    @city.destroy
 
    redirect_to cities_path

  end

  private 

  	def cities_params

  	  params.require(:city).permit(:city_id, :city_name)

    end

    def checking_authorization

      unless logged_in?

        flash[:danger] = "Log in, please"

        redirect_to root_path
      end
    end

    def checking_current_user_admin

      if !current_user.admin?
        flash[:danger] = "Get administrator rights"
        redirect_to cities_path
      end
    end
end
