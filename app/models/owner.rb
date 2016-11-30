class Owner < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "65x65>"},
   :default_url => "/assets/profile_pic.jpg"
   validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
