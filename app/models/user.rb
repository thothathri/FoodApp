require "digest/sha2"
class User < ActiveRecord::Base
	has_many :campus_foods
	
	

     def authenticate(username, password)
      user = User.find_by_uname(username)
      if user
		if user.passwd != password
			user = nil
		end
		user
	 end
     end


    
end
