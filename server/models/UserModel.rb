class User < ActiveRecord::Base
	self.table_name = 'users'
	# adds authenticate method and modifies password setter
	has_secure_password
end
