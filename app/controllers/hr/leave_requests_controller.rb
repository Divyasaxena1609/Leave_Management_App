class Hr::LeaveRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_hr!

  def index
    @leave_requests = LeaveRequest.where(hr_id: current_user.id , status: "pending")
    #render json: @leave_requests
  end

  def update
    leave_request = LeaveRequest.find(params[:id])
    employee_name = leave_request.employee.name
    if params[:status] == 'approved'
      leave_request.update(status: :approved)
      flash[:notice] = "Leave request for #{employee_name} has been approved successfully."
    else
      leave_request.update(status: :declined)
      flash[:alert] = "Leave request for #{employee_name} has been declined."
    end
    LeaveMailer.leave_status_email(leave_request).deliver_now
    #render json: leave_request
    redirect_to hr_leave_requests_path
  end

  private

  def authorize_hr!
    render json: { error: "Not authorized" }, status: :unauthorized unless current_user.hr?
  end

end
