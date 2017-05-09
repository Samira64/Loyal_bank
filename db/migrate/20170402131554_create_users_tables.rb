class CreateUsersTables < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :email
    	t.string :password_digest
        t.string :password_confirmation
    	t.datetime :last_login	
    	t.integer :login_count

    	t.timestamps
    end
  end
end