class OwnerMailer < ApplicationMailer
default from: 'notifications@example.com'
 
  def welcome_email(owner)
    @owner = owner
    @url  = 'http://example.com/login'
    mail(to: @owner.email, subject: 'Welcome to Bark Buddies!!')
  end
  def password_reset(owner)
  	p "sending mail to #{owner}"
  	@owner = owner
  	mail(to: @owner.email, subject: "Password Reset")
  end
end
