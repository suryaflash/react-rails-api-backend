class CreateUserdata < ActiveRecord::Migration
  def change
    create_table :userdata do |t|
      t.string :email
      t.string :password_digest

      #password_digest takes 2 params(password and password_confirmation...)
      #..And bcrypt gem uses these 2 params to hash the password . 
      	

      t.timestamps null: false
    end
  end
end
