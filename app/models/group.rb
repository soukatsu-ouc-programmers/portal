class Group < ApplicationRecord

	has_many :group_members, dependent: :destroy, foreign_key: 'group_id'
	has_many :members, through: :group_members
	accepts_nested_attributes_for :group_members, allow_destroy: true

end
