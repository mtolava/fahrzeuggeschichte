class AddColumnToVisit < ActiveRecord::Migration[8.1]
  def change
    add_reference :visits, :owner, null: false, foreign_key: true
  end
end
