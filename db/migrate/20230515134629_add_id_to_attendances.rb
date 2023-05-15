class AddIdToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :attendances, :attendee_id, :integer
    add_column :attendances, :event_id, :integer
  end
end
