class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
    @ordered_employee_tickets = @employee.tickets_by_oldest
    @oldest_ticket = @employee.oldest_ticket
  end
end