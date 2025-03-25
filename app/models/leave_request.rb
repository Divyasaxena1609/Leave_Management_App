class LeaveRequest < ApplicationRecord
  belongs_to :employee, class_name: 'User'
  belongs_to :hr, class_name: 'User'

  STATUSES = ["pending", "approved", "declined"].freeze

  validates :status, inclusion: { in: STATUSES }
  validate :leave_balance_check, on: :create

  scope :approved, -> { where(status: "approved") }  

  after_update :deduct_leave_balance, if: -> { status_changed? && status == "approved" }
  after_update :rollback_leave_balance, if: -> { saved_change_to_status? && status_was == "approved" && status != "approved" }

  def leave_balance_check
    days_requested = (end_date - start_date).to_i + 1
    if employee.leave_balance < days_requested
      errors.add(:base, "Not enough leave balance")
    end
  end

  def deduct_leave_balance
    days_requested = (end_date - start_date).to_i + 1
    employee.update(leave_balance: employee.leave_balance - days_requested)
  end

  def rollback_leave_balance
    days_requested = (end_date - start_date).to_i + 1
    employee.update(leave_balance: employee.leave_balance + days_requested)
  end
  
  def pending?
    status == "pending"
  end

  def approved?
    status == "approved"
  end

  def declined?
    status == "declined"
  end
end
