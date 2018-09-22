class Member < ApplicationRecord

	# has_many :group_members, dependent: :destroy, foreign_key: 'member_id'
	has_many :group_members, dependent: :destroy
	# has_many :groups, through: :group_members, foreign_key: 'id'
	has_many :groups, through: :group_members
	# has_many :member_idles, dependent: :destroy, foreign_key: 'member_id'
	has_many :member_idles, dependent: :destroy
	accepts_nested_attributes_for :group_members, allow_destroy: true
	accepts_nested_attributes_for :member_idles, allow_destroy: true

end
