Rails.application.routes.draw do
 post "/employees", to:'employees#create'
 
  get "/employees", to:'employees#index'
  get "/employees/new", to: 'employees#new'
   get "/employees/:id", to:'employees#show'
end
