class MemberIdle < ApplicationRecord

	belongs_to :member
	belongs_to :day_of_week
	belongs_to :block_time

end
