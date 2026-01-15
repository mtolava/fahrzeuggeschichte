class CreateVisits < ActiveRecord::Migration[8.1]
  def change
    create_table :visits do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :occurred_at, null: false
      t.text :reason, null: false
      t.integer :km
      t.text :notes
      t.string :status, default: 'open', null: false

      t.timestamps
    end
  end
end
