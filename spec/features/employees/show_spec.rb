require 'rails_helper'
# As a user,
# When I visit the Employee show page,
# I see the employee's name, department
# and a list of all of their tickets from oldest to youngest.
# I also see the oldest ticket assigned to the employee listed separately
RSpec.describe 'employee show page' do
  describe 'As a user' do
    describe "When I visit the Employee show page" do
      before :each do
        @department_1 = Department.create(name: 'IT', floor: 'Basement')
        @employee_1 = @department_1.employees.create(name: 'Tea', level: 2)
        @ticket_1 = @employee_1.tickets.create(subject: 'printers broken', age: 5)
        @ticket_2 = @employee_1.tickets.create(subject: 'copy machines broken', age: 3)
        @ticket_3 = @employee_1.tickets.create(subject: 'fax machines broken', age: 6)

        visit "/employees/#{@employee_1.id}"
      end
      it "I see the employee's name, department, and a list of all of their tickets" do
        expect(page).to have_content(@employee_1.name)
        expect(page).to have_content(@department_1.name)
        expect(page).to have_content(@ticket_1.subject)
        expect(page).to have_content(@ticket_2.subject)
        expect(page).to have_content(@ticket_3.subject)
      end

      it "Their tickets are arranged from oldest to youngest" do
        expect(@ticket_3.subject).to appear_before(@ticket_1.subject)
        expect(@ticket_1.subject).to appear_before(@ticket_2.subject)
      end

      it "I also see the oldest ticket assigned to the employee listed seperately" do
        within "section#oldest-ticket" do
          expect(page).to have_content(@ticket_3.subject)
          expect(page).to_not have_content(@ticket_1.subject)
          expect(page).to_not have_content(@ticket_2.subject)
          save_and_open_page
        end
      end
    end
  end
end