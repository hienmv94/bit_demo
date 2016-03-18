class Group < ActiveRecord::Base
	belongs_to :user
	
	has_many :members, dependent: :destroy
	has_many :assignments, dependent: :destroy
	
	accepts_nested_attributes_for :members, :allow_destroy => true
	validates :name, presence: true

end