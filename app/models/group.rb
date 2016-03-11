class Group < ActiveRecord::Base
	belongs_to :user
	
	has_many :members, dependent: :destroy
	has_many :assignments
	has_many :member_assignments

	accepts_nested_attributes_for :members, allow_destroy: true

	validates :name, presence: true

end