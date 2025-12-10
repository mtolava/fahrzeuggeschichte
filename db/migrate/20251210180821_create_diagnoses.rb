class CreateDiagnoses < ActiveRecord::Migration[8.1]
  def change
    create_table :diagnoses do |t|
      t.references :visit, null: false, foreign_key: true
      t.string :description
      t.string :resolution
      t.integer :cost_stimate

      t.timestamps
    end
  end
end
