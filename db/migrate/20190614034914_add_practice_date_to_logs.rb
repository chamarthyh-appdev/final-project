class AddPracticeDateToLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :logs, :practice_date, :date
  end
end
