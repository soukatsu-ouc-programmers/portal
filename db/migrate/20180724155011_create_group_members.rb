class CreateGroupMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_members do |t|
      t.integer :member_id, foreign_key: true, null: false
      t.integer :group_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
