class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.integer :student_id
      t.integer :case_id
      t.string :given_by
      t.string :feedback

      t.timestamps
    end
  end
end
