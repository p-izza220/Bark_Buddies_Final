class SessionsController < ApplicationController
  def new

  end

  def create
  	@owner = Owner.find_by(username: params[:username])
  	if @owner && @owner.password_digest && @owner.try(:authenticate, params[:password])
  		session[:owner_id] = @owner.id
  		redirect_to owners_url
  	else
  		redirect_to login_url, alert: "Invalid username/password combination"
  	end
  end

  def destroy
  	session[:owner_id] = nil
  	redirect_to home_url, alert: "You have successfully logged out."
  end
end
