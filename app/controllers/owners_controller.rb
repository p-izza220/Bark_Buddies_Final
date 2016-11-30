class OwnersController < ApplicationController
	def index
		@owners = Owner.all
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

	def checkin
		if session[:owner_id]
			Owner.find(session[:owner_id]).update(last_checkin: Date.new )
		else
			# bounce to homepage
			redirect_to root_route
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
