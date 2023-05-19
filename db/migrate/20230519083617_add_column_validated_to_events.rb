class AddColumnValidatedToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :validated, :boolean
  end
end
