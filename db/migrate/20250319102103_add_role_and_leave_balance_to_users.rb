class AddRoleAndLeaveBalanceToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :role, :string
    add_column :users, :leave_balance, :integer
  end
end
