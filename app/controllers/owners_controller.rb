class OwnersController < ApplicationController
	def index
		@owners = Owner.where(last_checkin: 2.hours.ago..Time.now).order(:last_checkin => :desc)
		@current_owner = Owner.find(session[:owner_id])
		if params[:search]
			@owners = Owner.search(params[:search]).where(last_checkin: 2.hours.ago..Time.now).order(:last_checkin => :desc)
		else
			@owners = Owner.where(last_checkin: 2.hours.ago..Time.now).order(:last_checkin => :desc)
		end
	end

	def new
		@owner = Owner.new
	end

	def create
		@owner = Owner.new(owner_params)
		if @owner.save
		 session[:owner_id] = @owner.id
		 redirect_to owners_path
		end
	end

	def show
		@current_owner = Owner.find(params[:id])

	end

	def checkin_with_cam
		#to do: add the update to checkin here (rails c syntax)
		Owner.find(session[:owner_id]).update(last_checkin: Time.now)
		render :json => {status: 'ok'}
	end

	def checkin
		if session[:owner_id]
			Owner.find(session[:owner_id]).update(last_checkin: Date.new )
		else
			redirect_to root_route, alert: "Incorrect username/password combination"
		end

	end	

	def checkout
		Owner.find(session[:owner_id]).update(last_checkin: nil)
		render :json => {status: 'ok'}
	end	

	def edit 
		@owner = Owner.find(session[:owner_id])
	end

	def update
		@owner = Owner.find(session[:owner_id])
		Owner.find(session[:owner_id]).update(owner_params)
		if @owner.save
			redirect_to owners_show_path, alert: "Your account has been updated"
		else
			redirect_to owners_edit_path, alert: "Uh oh... something went wrong"
		end
	end

	def destroy

	end

	private

	def owner_params
		params.require(:owner).permit(:username, :email, :dog_name, :avatar, :password, :password_confirmation, :last_checkin)
	end
end
