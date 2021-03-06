class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :dog_name
      t.binary :profile_pic
      t.datetime :last_checkin

      t.timestamps
    end
  end
end
