class CreateMemberIdles < ActiveRecord::Migration[5.2]
  def change
    create_table :member_idles do |t|
      t.integer :member_id, foreign_key: true, null: false
      t.integer :day_of_week_id, foreign_key: true, null: false
      t.integer :block_time_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
