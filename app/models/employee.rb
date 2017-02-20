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
    employee_hash = Unirest.get("#{ENV['DOMAIN']}/employees/#{id}.json",headers:{ "Accept" => "application/json", "Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => ENV['API_EMAIL']}).body
    Employee.new(employee_hash)
  end

  def self.all
    employee_hashes = Unirest.get("#{ENV['DOMAIN']}/employees.json",headers:{ "Accept" => "application/json", "Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => ENV['API_EMAIL']}).body
    employees = []
    employee_hashes.each do |employee_hash|
      employees << Employee.new(employee_hash)
    end
    return employees
  end

  def destroy
    
  end

end