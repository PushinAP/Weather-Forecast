class SessionsController < ApplicationController
  def new
  	if logged_in? 
  		redirect_to forestcast_weathers_path
  	end
  end

  def create
  	user = User.find_by(name: params[:session][:name].downcase)

  	if user && user.authenticate(params[:session][:password])
  		log_in(user)
  		redirect_to forestcast_weathers_path
  	else
  		render 'new'
  	end

  end

  def destroy
  	log_out
  	redirect_to root_url
  end

end
