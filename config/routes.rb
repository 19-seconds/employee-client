Rails.application.routes.draw do


  post "/employees", to:'employees#create'
  get "/employees", to:'employees#index'
  get "/employees/new", to: 'employees#new'
  get "/employees/:id", to:'employees#show'
  get "/employees/:id/edit", to: 'employees#edit'
  patch "/employees/:id", to: 'employees#update'
  delete "/employees/:id", to: 'employees#destroy'
end
