Rails.application.routes.draw do
   namespace :api do
    get "/orders" => 'orders#index'
    post "/orders" => "orders#create"
    get '/orders:id' => "orders#show"

    post "/sessions" => "sessions#create"

    post "/users" => "users#create"

    get '/products' => 'products#index'
    post '/products' => 'products#create'
    get '/products/:id' => 'products#show'
    
    patch 'products/:id' =>'products#update'
    delete '/products/:id' => 'products#destroy'

    post "/carted_products" => "carted_products#create"
    get "/carted_products" => 'carted_products#index'
    
   end 
end
