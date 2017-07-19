
class Membership < ActiveRecord::Base
	self.table_name = 'membership'
	belongs_to :character
	belongs_to :organization
end
