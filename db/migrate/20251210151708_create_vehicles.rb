class CreateVehicles < ActiveRecord::Migration[8.1]
  def change
    create_table :vehicles do |t|
      t.references :owner, null: false, foreign_key: true
      t.string :brand
      t.integer :model
      t.string :version
      t.integer :year
      t.string :plate
      t.integer :km

      t.timestamps
    end
  end
end
