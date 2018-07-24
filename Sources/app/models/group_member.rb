class GroupMember < ApplicationRecord
  belongs_to :member_id
  belongs_to :group_id
end
