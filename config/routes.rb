ApiFlashcards::Engine.routes.draw do
  root 'main#index'

  namespace :api do
    namespace :v1 do
      resources :cards do
        collection do
          get :review
        end
      end
    end
  end
end
