class MemberIdle < ApplicationRecord
  belongs_to :member_id
  belongs_to :day_of_week_id
  belongs_to :block_time_id
end
