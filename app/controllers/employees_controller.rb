class EmployeesController < ApplicationController
  
  def show
    @employee = Employee.find(params[:id])
  end

  def index
    @employees = Employee.all
  end

  def new
  end

  def create
    @employee = Unirest.post("#{ENV['DOMAIN']}/employees.json", :headers => {"Accept"=> "application/json"}, :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email=> params[:email], :birthdate => params[:birthdate], :ssn => params[:ssn]}).body
    redirect_to "/employees/#{@employee['id']}"
  end

  def edit
    @employee = Unirest.get("#{ENV['DOMAIN']}/employees/#{params[:id]}.json").body
  end

  def update
    @employee = Unirest.patch("#{ENV['DOMAIN']}/employees/#{params[:id]}.json", :headers => {"Accept"=> "application/json"}, :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email=> params[:email], :birthdate => params[:birthdate], :ssn => params[:ssn]}).body
    redirect_to "/employees/#{@employee['id']}"
  end

  def destroy
    Unirest.delete("#{ENV['DOMAIN']}/employees/#{params[:id]}.json").body
    redirect_to "/employees"
  end


end