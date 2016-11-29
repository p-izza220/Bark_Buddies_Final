class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.string :username
      t.string :password_digest
      t.string :contact
      t.string :dog_name
      t.binary :profile_pic

      t.timestamps
    end
  end
end
