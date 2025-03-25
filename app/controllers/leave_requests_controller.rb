class LeaveRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :clean_old_requests, only: [:index]
  def new
    @leave_request = LeaveRequest.new  
  end

  def index
    @leave_requests = current_user.leave_requests
  end


  def create
    leave_request = current_user.leave_requests.new(leave_request_params)
    leave_request.status ||= "pending"  # Default status if not provided
  
    if leave_request.save
      LeaveMailer.leave_request_email(leave_request).deliver_now
      #render json: leave_request, status: :created
      redirect_to leave_request_path(leave_request), notice: "Leave request submitted successfully!"
    else
      #render json: { error: leave_request.errors.full_messages }, status: :unprocessable_entity
      flash[:alert] = leave_request.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @leave_request = LeaveRequest.find(params[:id])
  end

  private

  def leave_request_params
    params.require(:leave_request).permit(:start_date, :end_date, :reason, :hr_id, :status)
  end

  def clean_old_requests
    LeaveRequest.where("end_date < ?", Date.today)
                .where(status: ["pending", "declined"])
                .destroy_all
  end

end
