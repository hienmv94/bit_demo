class Assignment < ActiveRecord::Base
	belongs_to :user
	belongs_to :group
	
	has_many :member_assignments, dependent: :destroy
	has_many :members, through: :member_assignments
	
	accepts_nested_attributes_for :member_assignments, :allow_destroy => true

	validates :name, presence: true
	validates :group_id, presence: true	
	validates :repo_name, presence: true	 
	validates :due_date, presence: true

	def find_link member_id
		record = MemberAssignment.get_link(self.id, member_id).first
		return record.link
	end
	
	def choose_members? member
    	member.updated_at.to_date <= self.due_date
  	end
end