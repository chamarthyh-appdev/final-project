class CreateCasebooks < ActiveRecord::Migration[5.1]
  def change
    create_table :casebooks do |t|
      t.string :casebook_name
      t.string :url

      t.timestamps
    end
  end
end
