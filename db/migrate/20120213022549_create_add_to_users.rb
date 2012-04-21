class CreateAddToUsers < ActiveRecord::Migration
  def change
    create_table :add_to_users do |t|
	 def up
    User.create :uname => "admin",
                 :name => "admin",
                 :email => "admin@gmail.com",
                 :passwd => "password",
                 :admin => true
	end

	def down
	end
      t.timestamps
    
    end
  end
end
