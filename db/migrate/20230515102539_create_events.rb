class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.string :title
      t.string :location
      t.text :description
      t.integer :price
      t.integer :duration
      t.timestamps
    end
  end
end