
class Character < ActiveRecord::Base
	self.table_name = 'characters'
	has_many :memberships, :class_name => 'Membership'
	has_many :organizations, through: :memberships
end

