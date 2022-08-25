class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :currently_leading
      t.integer :championships_won

      t.timestamps
    end
  end
end
