$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "api_flashcards/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "api_flashcards"
  s.version     = ApiFlashcards::VERSION
  s.authors     = ["Alexander Zutikov"]
  s.email       = ["zvlex.dev@gmail.com"]
  s.homepage    = "http://localhost:3000"
  s.summary     = "Flashcards API"
  s.description = "Step 5 - Rails Engines"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
  s.add_dependency "active_model_serializers", '~> 0.10.0'
  s.add_dependency "kaminari"
  s.add_dependency "yard"
  s.add_development_dependency 'rspec-rails'

  s.add_development_dependency "sqlite3"
end
