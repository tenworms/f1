class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :name
      t.boolean :up_for_hire
      t.integer :drivers_age
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
