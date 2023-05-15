class AddIdToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :administrator_id, :integer
  end
end
