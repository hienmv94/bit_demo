class Member < ActiveRecord::Base
	belongs_to :user
	belongs_to :group
	has_many :member_assignments
	has_many :assignments, through: :member_assignments

	validates :name, presence: true
end