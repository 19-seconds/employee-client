class EmployeesController < ApplicationController
def show
  @employee = Unirest.get("http://localhost:3000/api/v1/employees/#{params[:id]}.json").body
end

def index
  @employees = Unirest.get("http://localhost:3000/api/v1/employees.json").body
end

def create
  @employee = Unirest.post("http://localhost:3000/api/v1/employees.json", :headers => {"Accept"=> "application/json"}, :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email=> params[:email], :birthdate => params[:birthdate], :ssn => params[:ssn]}).body
  redirect_to "/employees/#{@employee['id']}"
end

def new

end

end