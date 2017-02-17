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

end