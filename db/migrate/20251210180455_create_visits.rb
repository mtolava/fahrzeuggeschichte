class CreateVisits < ActiveRecord::Migration[8.1]
  def change
    create_table :visits do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :occurred_at
      t.text :reason
      t.integer :km
      t.text :notes
      t.string :status

      t.timestamps
    end
  end
end
