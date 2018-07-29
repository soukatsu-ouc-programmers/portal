class GroupMember < ApplicationRecord

	belongs_to :member, foreign_key: 'id'
	belongs_to :group, foreign_key: 'id'

end
