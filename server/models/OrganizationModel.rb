
class Organization < ActiveRecord::Base
	self.table_name = 'organizations'
	has_many :memberships
	has_many :characters, through: :memberships
end

