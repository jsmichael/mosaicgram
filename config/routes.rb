Rails.application.routes.draw do

  root:to => "main#view"
  
  get ":controller(/:action(/:id))"
  post ":controller(/:action(/:id))"

end