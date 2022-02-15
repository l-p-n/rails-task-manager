Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # READ all
  get 'tasks', to: 'tasks#index'

  # CREATE
  # The `new` route needs to be before `show` route, as otherwise it will think 'new' is an 'id'
  get 'tasks/new', to: 'tasks#new'
  post 'tasks', to: 'tasks#create'

   # READ one
   get 'tasks/:id', to: 'tasks#show', as: :task

  # UPDATE
  get "tasks/:id/edit", to: "tasks#edit", as: :edit_task
  patch "tasks/:id", to: "tasks#update"

  # DELETE
  delete "tasks/:id/delete", to: "tasks#destroy", as: :delete_task
end
