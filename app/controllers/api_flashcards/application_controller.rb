module ApiFlashcards
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    http_basic_authenticate_with name: 'zvlex', password: 'apitome1'
  end
end
