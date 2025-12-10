class CreateInspections < ActiveRecord::Migration[8.1]
  def change
    create_table :inspections do |t|
      t.references :visit, null: false, foreign_key: true
      t.string :type
      t.string :description
      t.string :severity

      t.timestamps
    end
  end
end
