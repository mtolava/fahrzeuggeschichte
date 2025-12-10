class CreateOwners < ActiveRecord::Migration[8.1]
  def change
    create_table :owners do |t|
      t.string :firstname
      t.string :lastname
      t.integer :document
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
