class Member < ApplicationRecord

	has_many :group_members, dependent: :destroy, foreign_key: 'member_id'
	has_many :groups, through: :group_members, foreign_key: 'id'
	accepts_nested_attributes_for :group_members, allow_destroy: true

end
