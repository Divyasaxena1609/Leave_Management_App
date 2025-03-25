class CreateLeaveRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :leave_requests do |t|
      t.integer :employee_id
      t.date :start_date
      t.date :end_date
      t.string :status
      t.text :reason
      t.integer :hr_id

      t.timestamps
    end
  end
end
