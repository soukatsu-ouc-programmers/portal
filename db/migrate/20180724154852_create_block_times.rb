class CreateBlockTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :block_times do |t|
      t.string :name, null: false
      t.integer :order, null: false

      t.timestamps
    end
  end
end
