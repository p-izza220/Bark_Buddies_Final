class Owner < ApplicationRecord
  attr_accessor :reset_token
  has_secure_password
  validates :username, presence: true, uniqueness: true
  # validates :email, presence: true, uniqueness: true

  has_attached_file :avatar,
   :default_url => "/assets/profile_pic.jpg"
   validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

   def checkedIn?
   	 self.last_checkin && self.last_checkin > Time.now - 2.hours 
   end

   def self.search(search)
  	where("dog_name LIKE ? OR username LIKE ?", "%#{search}%", "%#{search}%") 
   end




      # below relates to "forgot my password" function - still working on this



   # sets the password reset attributes 
   def create_reset_digest
    self.reset_token = Owner.new_token
    update_attribute(:reset_digest, Owner.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
   end

   # sends password reset email
   def send_password_reset_email
    OwnerMailer.password_reset(self).deliver_now
   end

   def self.new_token
    SecureRandom.urlsafe_base64
   end
  
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


   private
  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end

end
