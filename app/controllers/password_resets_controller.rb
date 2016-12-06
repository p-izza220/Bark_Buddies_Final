class PasswordResetsController < ApplicationController
  before_action :get_owner, only: [:edit, :update]
  before_action :valid_owner, only: [:edit, :update]

  def new
  end

  def create
  	@owner = Owner.find_by(email: params[:password_reset][:email].downcase)
	 if @owner
	   @owner.create_reset_digest
	   @owner.send_password_reset_email
	   flash[:alert] = "Email sent with password reset instructions"
	   redirect_to login_path
	 else
	   flash.now[:danger] = "Email address not found"
	   render 'new'
	 end
  end

  def edit

  end

  def update
    if params[:owner][:password].empty?
      @owner.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @owner.update_attributes(owner_params)
      log_in @owner
      flash[:success] = "Password has been reset."
      redirect_to @owner
    else
      render 'edit'            
    end
  end
  
private

    def owner_params
      params.require(:owner).permit(:password, :password_confirmation)
    end

  def get_owner
  	@owner = Owner.find_by(email: params[:email])
  end



  # def valid_owner
  # 	unless (@owner && @owner.activated? &&)
  # end
end
