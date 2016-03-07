class Member_assignment < ActiveRecord::Base
	belongs_to :assignment
	belongs_to :member
end