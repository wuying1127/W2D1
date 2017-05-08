class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @boss.employees << self unless boss.nil?
  end

  def bonus(multiplier)
    salary * multiplier
  end

  def employees_total_salary
    0
  end

end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss)
    @employees = []
    super
  end

  def bonus(multiplier)
    employees_total_salary * multiplier
  end

  def employees_total_salary
    salary = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        salary += employee.employees_total_salary
      end

      salary += employee.salary
    end

    salary
  end

end

# ned = Manager.new("Ned", "Founder", 1_000_000, nil)
# darren = Manager.new("Darren", "TA Manager", 78_000, ned)
# shawna = Employee.new("Shawna", "TA", 12_000, darren)
# david = Employee.new("David", "TA", 10_000, darren)

puts ned.bonus(5)
puts darren.bonus(4)
puts david.bonus(3)
