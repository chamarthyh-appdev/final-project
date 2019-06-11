class CreateCasebanks < ActiveRecord::Migration[5.1]
  def change
    create_table :casebanks do |t|
      t.string :title
      t.string :difficulty
      t.boolean :is_brainstorm
      t.integer :num_exhibits
      t.integer :casebook_id
      t.string :is_math_heavy
      t.string :case_type
      t.string :industry
      t.boolean :is_interviewer_led

      t.timestamps
    end
  end
end
