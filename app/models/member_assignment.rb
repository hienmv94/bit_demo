class MemberAssignment < ActiveRecord::Base
	belongs_to :assignment
	belongs_to :member

	scope :get_link, ->(assignment_id, member_id) {
  		where(member_id: member_id, assignment_id: assignment_id)
  	}
end