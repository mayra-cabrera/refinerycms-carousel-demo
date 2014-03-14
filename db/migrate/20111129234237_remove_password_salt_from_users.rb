class RemovePasswordSaltFromUsers < ActiveRecord::Migration
  def up
    remove_column :refinery_users, :password_salt
    # Make the current password invalid :(
    Refinery::User.all.each do |u|
      u.update_attribute(:encrypted_password, u.encrypted_password[29..-1])
    end
  end

  def down
    add_column :refinery_users, :password_salt, :string
  end
end
