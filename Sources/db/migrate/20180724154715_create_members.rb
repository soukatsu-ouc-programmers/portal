class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.string :kana, null: false
      t.string :line_name, null: false
      t.integer :student_number, null: false
      t.text :skill
      t.text :description

      t.timestamps
    end
  end
end
