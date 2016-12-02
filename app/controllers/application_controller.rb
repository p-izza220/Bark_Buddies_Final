class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # def current_user
  # 	Owner.find(session[:owner_id])
  # end
end
