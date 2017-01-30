Rails.application.routes.draw do

	require 'sidekiq/web'
	mount Sidekiq::Web => '/sidekiq'
	
  get 'welcome/index'

  root "welcome#index"

  post 'generate', to: "welcome#generate"

  get 'download_csv', to: "welcome#download_csv"

  post 'generate_csv', to: "welcome#generate_file"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
