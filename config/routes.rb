require 'api_version_constraint'
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'personapiinloco' }, path: '/' do
    namespace :v1, path: '/', constraints: ApiVersionConstraint.new(version: 1) do
      resources :persons, param: :uuid, only: [:show, :index, :create, :update]
    end
  end
end
