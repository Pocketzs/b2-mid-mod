class Employee < ApplicationRecord
  belongs_to :department
  has_many :tickets

  def department_name
    self.department.name
  end

  def tickets_by_oldest
    self.tickets.order(age: :desc)
  end

  def oldest_ticket
    self.tickets_by_oldest.first
  end
end