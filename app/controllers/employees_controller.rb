class EmployeesController < ApplicationController
def show
  @employee = Unirest.get("#{ENV['DOMAIN']}/employees/#{params[:id]}.json").body
end

def index
  @employees = Unirest.get("#{ENV['DOMAIN']}/employees.json").body
end

def create
  @employee = Unirest.post("#{ENV['DOMAIN']}/employees.json", :headers => {"Accept"=> "application/json"}, :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email=> params[:email], :birthdate => params[:birthdate], :ssn => params[:ssn]}).body
  redirect_to "/employees/#{@employee['id']}"
end

def new

end

end