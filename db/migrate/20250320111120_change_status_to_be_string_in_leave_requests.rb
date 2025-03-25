class ChangeStatusToBeStringInLeaveRequests < ActiveRecord::Migration[8.0]
  def up
    change_column :leave_requests, :status, :string
  end

  def down
    change_column :leave_requests, :status, :integer
  end
end
