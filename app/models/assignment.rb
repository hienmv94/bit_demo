class Assignment < ActiveRecord::Base
	belongs_to :user
	belongs_to :group
	
	has_many :member_assignments
	has_many :members, through: :member_assignments 

	validates :name, presence: true
	validates :group_id, presence: true	
	validates :repo_name, presence: true	 
	validates :due, presence: true

end