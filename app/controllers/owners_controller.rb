class OwnersController < ApplicationController
	def index
		@owners = Owner.where(last_checkin: 2.hours.ago..Time.now).order(:last_checkin => :desc)
	end

	def new
		@owner = Owner.new
	end

	def create
		@owner = Owner.new(owner_params)
		if @owner.save
		 redirect_to owners_path
		end
	end

	def show
		@current_owner = Owner.find(params[:id])

	end

	def checkin_with_cam
		#to do: add the update to checkin here (rails c syntax)
	end

	def checkin
		if session[:owner_id]
			Owner.find(session[:owner_id]).update(last_checkin: Date.new )
		else
			redirect_to root_route, alert: "Incorrect username/password combination"
		end
	end	

	def edit 

	end

	def update

	end

	def destroy

	end

	private

	def owner_params
		params.require(:owner).permit(:username, :contact, :dog_name, :avatar, :password, :password_confirmation, :last_checkin)
	end
end
