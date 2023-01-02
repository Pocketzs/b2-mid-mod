require 'rails_helper'
# As a user,
# When I visit the Department index page,
# I see each department's name and floor
# And underneath each department, I can see the names of all of its employees
RSpec.describe "departments index page" do
  describe 'As a user' do
    describe 'When I visit the department index page' do
      before :each do
        @department_1 = Department.create(name: 'IT', floor: 'Basement')
        @department_2 = Department.create(name: 'HR', floor: '1st Floor')
        @department_3 = Department.create(name: 'Sales', floor: '2nd Floor')

        @employee_1 = @department_1.employees.create(name: 'Tea', level: 2)
        @employee_2 = @department_1.employees.create(name: 'Michael', level: 1)
        @employee_3 = @department_1.employees.create(name: 'Fish', level: 3)
        
        @employee_4 = @department_2.employees.create(name: 'Christine', level: 4)

        visit '/departments'
      end

      it 'I see each departments name and floor' do
        expect(page).to have_content('IT')
        expect(page).to have_content('Basement')
        expect(page).to have_content('HR')
        expect(page).to have_content('1st Floor')
        expect(page).to have_content('Sales')
        expect(page).to have_content('2nd Floor')
      end

      describe "And underneath each department" do
        it "I can see the names of all of its employees" do
          within("#department_#{@department_1.id}") do
            expect(page).to have_content("#{@employee_1.name}")
            expect(page).to have_content("#{@employee_2.name}")
            expect(page).to have_content("#{@employee_3.name}")
            expect(page).to_not have_content("#{@employee_4.name}")
          end
          within("#department_#{@department_2.id}") do
            expect(page).to_not have_content("#{@employee_1.name}")
            expect(page).to_not have_content("#{@employee_2.name}")
            expect(page).to_not have_content("#{@employee_3.name}")
            expect(page).to have_content("#{@employee_4.name}")
          end
        end
      end
    end
  end
end