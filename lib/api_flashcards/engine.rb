require 'active_model_serializers'
require 'kaminari'

module ApiFlashcards
  class Engine < ::Rails::Engine
    isolate_namespace ApiFlashcards
  end
end
