class OwnersController < ApplicationController
	def index

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

	end

	def edit 

	end

	def update

	end

	def destroy

	end

	private

	def owner_params
		params.require(:owner).permit(:username, :contact, :dog_name, :password, :password_confirmation)
	end
end
