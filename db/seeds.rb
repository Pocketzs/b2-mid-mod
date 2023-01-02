# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@department_1 = Department.create(name: 'IT', floor: 'Basement')
@department_2 = Department.create(name: 'HR', floor: '1st Floor')
@department_3 = Department.create(name: 'Sales', floor: '2nd Floor')

@employee_1 = @department_1.employees.create(name: 'Tea', level: 2)
@employee_2 = @department_1.employees.create(name: 'Michael', level: 1)
@employee_3 = @department_1.employees.create(name: 'Fish', level: 3)

@employee_4 = @department_2.employees.create(name: 'Christine', level: 4)