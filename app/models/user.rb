class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = { "employee" => "employee", "hr" => "hr" }.freeze

  validates :role, presence: true
  validates :name, presence: true, length: { minimum: 2, maximum: 50 } 
  
  # Setter method for role 
  def role=(value)
    write_attribute(:role, ROLES[value]) if ROLES.key?(value)
  end

  # Getter method for role
  def role
    read_attribute(:role) 
  end

  def employee?
    role == "employee"
  end

  def hr?
    role == "hr"
  end

  scope :only_hr, -> { where(role: "hr") }  
  
  has_many :leave_requests, foreign_key: :employee_id, dependent: :destroy

  after_create :set_initial_leave_balance

  private

  def set_initial_leave_balance
    self.update_column(:leave_balance, 30)
  end
end
