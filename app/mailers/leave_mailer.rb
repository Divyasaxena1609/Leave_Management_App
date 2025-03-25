class LeaveMailer < ApplicationMailer
    def leave_request_email(leave_request)
        @leave_request = leave_request
        mail(to: @leave_request.hr.email, cc: @leave_request.employee.email , subject: "New Leave Request")
      end
    
      def leave_status_email(leave_request)
        @leave_request = leave_request
        mail(to: @leave_request.employee.email, subject: "Leave Request Status Update")
      end
    
end
