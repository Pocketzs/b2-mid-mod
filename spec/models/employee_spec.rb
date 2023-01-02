require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'relationships' do
    it { should belong_to :department }
    it { should have_many :tickets }
  end

  describe 'instance methods' do
    before :each do
      @department_1 = Department.create(name: 'IT', floor: 'Basement')
      @employee_1 = @department_1.employees.create(name: 'Tea', level: 2)
      @ticket_1 = @employee_1.tickets.create(subject: 'printers broken', age: 5)
      @ticket_2 = @employee_1.tickets.create(subject: 'copy machines broken', age: 3)
      @ticket_3 = @employee_1.tickets.create(subject: 'fax machines broken', age: 6)
    end

    describe '#department_name' do
      it 'returns the department name of the employee' do
        expect(@employee_1.department_name).to eq(@department_1.name)
      end
    end

    describe '#tickets_by_oldest' do
      it 'returns an array of employees tickets ordered by oldest age' do
        expected = [@ticket_3, @ticket_1, @ticket_2]

        expect(@employee_1.tickets_by_oldest).to eq(expected)
      end
    end

    describe '#oldest_ticket' do
      it 'returns the oldest ticket of the employee' do
        expect(@employee_1.oldest_ticket).to eq(@ticket_3)
      end
    end
  end
end