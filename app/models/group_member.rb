class GroupMember < ApplicationRecord

	has_many :members, foreign_key: 'id'
	has_many :groups, foreign_key: 'id'

end
