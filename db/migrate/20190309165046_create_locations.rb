class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.belongs_to :trip, foreign_key: true
      t.integer :days

      t.timestamps
    end
  end
end
