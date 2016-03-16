class Assignment < ActiveRecord::Base
	belongs_to :user
	belongs_to :group
	
	has_many :member_assignments
	has_many :members, through: :member_assignments 

	accepts_nested_attributes_for :member_assignments, :allow_destroy => true

	validates :name, presence: true
	validates :group_id, presence: true	
	validates :repo_name, presence: true	 
	validates :due_date, presence: true

end