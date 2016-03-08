class Assignment < ActiveRecord::Base
	belongs_to :user
	belongs_to :group
	
	has_many :member_assignments
	has_many :members, through: :member_assignments 
end