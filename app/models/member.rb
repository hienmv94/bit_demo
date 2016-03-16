class Member < ActiveRecord::Base
	belongs_to :user
	belongs_to :group
	has_many :member_assignments, dependent: :destroy

	validates :name, presence: true
end