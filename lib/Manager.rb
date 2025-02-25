class Manager

    attr_reader :name, :age
    attr_accessor :department

    @@all = []

    # Manager#name returns a String that is the manager's name
    # Manager#department returns a String that is the department that the manager oversees
    # Manager#age returns a Fixnum that is the age of the manager
    def initialize(name, department, age)
        @name = name
        @department = department
        @age = age
        @@all << self
    end

    # Manager.all returns an Array of all the managers
    def self.all
        @@all
    end

    # Manager#employees returns an Array of all the employees that the manager oversees
    def employees
        Employee.all.select{|employee| employee.manager_name == self}
    end

    # Manager#hire_employee takes a String argument and a Fixnum argument of an 
    # employee's name and the employee's salary, respectively, and adds that employee 
    # to the list of employees that the manager oversees
    def  hire_employee(employee_name, salary)
        Employee.new(employee_name, salary, self)
    end

    # Manager.all_departments returns an Array of all the department names that every manager oversees
    def self.all_departments
        self.all.map{|manager| manager.department}
    end

    # Manager.average_age returns a Float that is the average age of all the managers
    def self.average_age
        find_age = self.all.map{|manager| manager.age}
        find_age.inject{ |sum, el| sum + el }.to_f / find_age.size
    end

end