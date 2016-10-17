module ApiFlashcards
  class MainController < ApplicationController
    def index
      render json: {}, status: 200
    end
  end
end
