require 'csv'
require 'prawn'
require 'prawn/table'

class Hr::ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_hr!

  def index
    @employees = User.where(role: "employee")
  end


  def export_my_approved_leaves_csv
    leave_data = LeaveRequest.where(hr_id: current_user.id, status: "approved")

    csv_data = CSV.generate(headers: true) do |csv|
      csv << ["Employee Name", "HR Name", "Start Date", "End Date", "Status", "Reason"]
      leave_data.each do |leave|
        csv << [
          leave.employee.name,
          leave.hr.name,
          leave.start_date.strftime("%Y-%m-%d"),
          leave.end_date.strftime("%Y-%m-%d"),
          leave.status.capitalize,
          leave.reason
        ]
      end
    end

    send_data csv_data, filename: "approved_leaves_#{current_user.id}.csv"
  end


  def export_my_approved_leaves_pdf
    leave_data = LeaveRequest.where(hr_id: current_user.id, status: "approved").includes(:employee, :hr)

    pdf = Prawn::Document.new
    pdf.text "Approved Leave Report (#{current_user.name})", size: 20, style: :bold, align: :center
    pdf.move_down 10


    table_data = [["Employee Name", "HR Name", "Start Date", "End Date", "Status", "Reason"]]


    leave_data.each do |leave|
      table_data << [
        leave.employee.name,
        leave.hr.name,
        leave.start_date.strftime("%Y-%m-%d"),
        leave.end_date.strftime("%Y-%m-%d"),
        leave.status.capitalize,
        leave.reason
      ]
    end


    pdf.table(table_data, header: true, width: 550, row_colors: ["DDDDDD", "FFFFFF"])

    send_data pdf.render, filename: "approved_leaves_#{current_user.id}.pdf", type: "application/pdf"
  end


  def export_employee_csv
    employee = User.find(params[:id])
    leave_data = LeaveRequest.where(employee_id: employee.id, status: "approved").includes(:hr)

    csv_data = CSV.generate(headers: true) do |csv|
      csv << ["HR Name", "Start Date", "End Date", "Status", "Reason"]
      leave_data.each do |leave|
        csv << [
          leave.hr.name,
          leave.start_date.strftime("%Y-%m-%d"),
          leave.end_date.strftime("%Y-%m-%d"),
          leave.status.capitalize,
          leave.reason
        ]
      end
    end

    send_data csv_data, filename: "leave_report_#{employee.id}.csv"
  end

  
  def export_employee_pdf
    employee = User.find(params[:id])
    leave_data = LeaveRequest.where(employee_id: employee.id, status: "approved").includes(:hr)

    pdf = Prawn::Document.new
    pdf.text "Approved Leave Report for #{employee.name}", size: 20, style: :bold, align: :center
    pdf.move_down 10


    table_data = [["HR Name", "Start Date", "End Date", "Status", "Reason"]]


    leave_data.each do |leave|
      table_data << [
        leave.hr.name,
        leave.start_date.strftime("%Y-%m-%d"),
        leave.end_date.strftime("%Y-%m-%d"),
        leave.status.capitalize,
        leave.reason
      ]
    end

  
    pdf.table(table_data, header: true, width: 550, row_colors: ["DDDDDD", "FFFFFF"])

    send_data pdf.render, filename: "leave_report_#{employee.id}.pdf", type: "application/pdf"
  end

  private

  def authorize_hr!
    redirect_to root_path, alert: "Unauthorized Access!" unless current_user.hr?
  end
end
