class AddUserIdToReports < ActiveRecord::Migration[6.0]
  def change
    add_reference :reports, :user, foreign_key: true
    change_column :reports, :user_id, :integer, null: false
  end
end
