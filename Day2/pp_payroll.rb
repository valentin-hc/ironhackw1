class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
    def calculate_salary
        #What will this return? 
    end
end

class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
      super(name, email) #Navigator, look into what super does. 
    @hourly_rate = hourly_rate
    @hours_worked = hours_worked
  end
  def calculate_salary
      #returns the hours worked * hourly_rate
      salary = @hourly_rate * @hours_worked
  end
end

class Salaried_Employee < Employee
    def initialize(name, email, monthly_salary)
      super(name, email) #Navigator, look into what super does. 
    @monthly_salary = monthly_salary
  end
  def calculate_salary
      #returns the hours worked * hourly_rate
      salary = @monthly_salary
  end
end
class MultiPaymentEmployee < Employee
	#attr_reader :hourly_rate, :hours_worked
    def initialize(name, email, hourly_rate, hours_worked, monthly_salary)
      super(name, email) #Navigator, look into what super does. 
    @hourly_rate = hourly_rate
    @hours_worked = hours_worked
    @monthly_salary = monthly_salary
  end
  def calculate_salary
      #returns the hours worked * hourly_rate
      if @hours_worked <= 40 
      	salary= @monthly_salary
      else
      	extra_hours = @hours_worked - 40
      	salary = @monthly_salary + extra_hours * @hourly_rate
      end
  end
end


class Payroll
  def initialize(employees)
      @employees = employees
  end

  def pay_employees
      # Should output how much we're paying each employee for this week and the total amount spent on payroll this week.
      @employees.each do | employee |
        puts "#{employee.name} => #{employee.calculate_salary} of which #{(employee.calculate_salary*0.18).to_i} taxes" 
      end
  end
  def total_payroll
    @employees.reduce(0) {|sum, employee| sum += employee.calculate_salary}
  end

  def notify_employee(employee)


end
bob = HourlyEmployee.new("Bob", "bobby@hot.com", 25, 50)

steve = Salaried_Employee.new("Steve", "whatever@bla.com", 3000)

mike = MultiPaymentEmployee.new("Mike", "m@m.com", 25, 50, 3000)
#puts bob.calculate_salary
#puts steve.calculate_salary
#puts mike.calculate_salary


employees = [bob, steve, mike]
payroll1 = Payroll.new(employees) 
payroll1.pay_employees
puts payroll1.total_payroll


