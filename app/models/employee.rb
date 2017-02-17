class Employee

  attr_accessor :id, :first_name, :last_name, :birthdate, :email, :ssn

  def initialize(hash)
    @id = hash['id']
    @first_name = hash['first_name']
    @last_name = hash['last_name']
    @birthdate = hash['birthdate']
    @email = hash['email']
    @ssn = hash['ssn']
  end

  def self.find(id)
    employee_hash = Unirest.get("#{ENV['DOMAIN']}/employees/#{id}.json").body
    Employee.new(employee_hash)
  end

  def self.all
    #finish this
  end

end